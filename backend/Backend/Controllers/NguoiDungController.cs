using BLL;
using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using OfficeOpenXml.FormulaParsing.LexicalAnalysis;
using System.Security.Cryptography;
using System.Text;

namespace Backend.Controllers
{
    [Authorize(Roles = "1")]
    [Route("api/[controller]")]
    [ApiController]
    public class NguoiDungController : ControllerBase
    {
        private INguoiDungBLL _nguoiDungbll;
        private IEmailBLL _emailbll;
        private string _path;
        public NguoiDungController(INguoiDungBLL nguoiDungbll, IEmailBLL emailbll, IConfiguration configuration)
        {
            _nguoiDungbll = nguoiDungbll;
            _emailbll = emailbll;
            _path = configuration["AppSettings:PATH_NGUOIDUNG"];
        }

        [AllowAnonymous]
        [Route("login")]
        [HttpPost]
        public IActionResult Login([FromBody] NguoiDungModel model)
        {
            try
            {
                var nguoidung = _nguoiDungbll.Check(model.TaiKhoan, model.Email);
                model.MatKhau = CalculateMD5Hash(model.MatKhau);

                var kq = _nguoiDungbll.Login(model.TaiKhoan, model.MatKhau);
                if (kq == null)
                    return BadRequest(new { success = false, message = "Tài khoản hoặc mật khẩu không chính xác" });

                if (kq.EmailConfimed == false)
                    return Ok(new { success = false, message = "Tài khoản chưa được xác minh, vui lòng xác minh trong email của bạn" });                       
                return Ok(new { success = true, message = "Đăng nhập thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("get-all")]
        [HttpPost]
        public IActionResult GetAll([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());

                string ten = "";
                if (formData.Keys.Contains("ten") && !string.IsNullOrEmpty(Convert.ToString(formData["ten"]))) { ten = Convert.ToString(formData["ten"].ToString()); }

                int? idQuyen = null;
                if (formData.Keys.Contains("idQuyen") && !string.IsNullOrEmpty(Convert.ToString(formData["idQuyen"]))) { idQuyen = int.Parse(formData["idQuyen"].ToString()); }

                int total = 0;
                var data = _nguoiDungbll.GetAll(page, pageSize, out total, ten, idQuyen);

                var response = new
                {
                    success = true,
                    message = "Lấy dữ liệu thành công",
                    totalItems = total,
                    page = page,
                    pageSize = pageSize,
                    data = data
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [AllowAnonymous]
        [Route("create")]
        [HttpPost]
        public IActionResult Create([FromBody] NguoiDungModel model)
        {
            try
            {
                var kq = _nguoiDungbll.Check(model.TaiKhoan, model.Email);
                if (kq != null)
                    return Ok(new { success = false, message = "Tài khoản hoặc email đã tồn tại trong hệ thống", data = kq });

                model.MatKhau = CalculateMD5Hash(model.MatKhau);
                model.Token = GenerateToken(32);

                _nguoiDungbll.Create(model);

                _emailbll.SendConfirmationEmail(model.Email, model.ConfirmationLink, model.Token);

                return Ok(new { success = true, message = "Đăng ký thành công, Email xác nhận đã được gửi" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [AllowAnonymous]
        [HttpPost("confirm-email")]
        public IActionResult ConfirmEmail([FromBody] NguoiDungModel model)
        {
            try
            {
                bool result = _nguoiDungbll.ConfirmEmail(model.Token);

                if (result)
                    return Ok(new { success = true, message = "Xác nhận email thành công" });
                else
                    return BadRequest(new { success = false, message = "Xác nhận email thất bại" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromForm] NguoiDungModel model)
        {
            try
            {
                // Kiểm tra xem người dùng có tải lên một ảnh mới không
                if (Request.Form.Files.Count > 0)
                {
                    // Lấy file ảnh từ yêu cầu
                    var uploadedFile = Request.Form.Files[0];
                    // Tạo tên file duy nhất cho ảnh mới
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + uploadedFile.FileName;
                    // Kết hợp đường dẫn thư mục lưu trữ ảnh và tên file duy nhất để tạo đường dẫn đầy đủ
                    string filePath = Path.Combine(_path, uniqueFileName);

                    var Model = _nguoiDungbll.GetByID(model.ID);

                    // Xoá file ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(Model.Anh) && Model.Anh != "avatar.png")
                    {
                        string oldFilePath = Path.Combine(_path, Model.Anh);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Lưu ảnh mới vào thư mục được chỉ định
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        uploadedFile.CopyTo(stream);
                    }

                    // Cập nhật đường dẫn ảnh mới vào đối tượng Model
                    model.Anh = uniqueFileName;
                }

                // Mã hoá mật khẩu nếu nó được cung cấp
                if (!string.IsNullOrEmpty(model.MatKhau))
                {
                    model.MatKhau = CalculateMD5Hash(model.MatKhau);
                }

                // Gọi phương thức cập nhật từ BLL với thông tin mới
                _nguoiDungbll.Update(model);

                return Ok(new { success = true, message = "Cập nhật thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("delete/{id}")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            try
            {
                // Lấy thông tin từ cơ sở dữ liệu
                var model = _nguoiDungbll.GetByID(id);

                if (model == null)
                {
                    return NotFound(new { success = false, message = "Người dùng không tồn tại" });
                }

                // Xoá file ảnh từ thư mục lưu trữ
                if (!string.IsNullOrEmpty(model.Anh) && model.Anh != "avatar.png")
                {
                    string filePath = Path.Combine(_path, model.Anh);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                }

                // Xoá từ cơ sở dữ liệu
                bool result = _nguoiDungbll.Delete(id);

                if (result)
                {
                    return Ok(new { success = true, message = "Xóa thành công" });
                }
                else
                {
                    return NotFound(new { success = false, message = "Không thể xoá" });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        public static string CalculateMD5Hash(string input)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder stringBuilder = new StringBuilder();

                for (int i = 0; i < data.Length; i++)
                {
                    stringBuilder.Append(data[i].ToString("x2"));
                }

                return stringBuilder.ToString();
            }
        }

        public static string GenerateToken(int length)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                var bytes = new byte[length];
                rng.GetBytes(bytes);
                return Convert.ToBase64String(bytes);
            }
        }
    }
}
