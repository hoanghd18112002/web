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
    [Route("api/[controller]")]
    [ApiController]
    public class NguoiDungController : ControllerBase
    {
        private INguoiDungBLL _nguoiDungbll;
        private IEmailBLL _emailbll;
        private IThamSoBLL _thamsobll;
        private string _path;
        public NguoiDungController(INguoiDungBLL nguoiDungbll, IEmailBLL emailbll, IConfiguration configuration, IThamSoBLL thamsobll)
        {
            _nguoiDungbll = nguoiDungbll;
            _emailbll = emailbll;
            _thamsobll = thamsobll;
            _path = configuration["AppSettings:PATH_NGUOIDUNG"];
        }

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

                if (kq.EmailConfirmed == false)
                    return Ok(new { success = false, message = "Tài khoản chưa được xác minh, vui lòng xác minh trong email của bạn" });                       
                return Ok(new { success = true, message = "Đăng nhập thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Authorize(Roles = "1")]
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
                model.Token = GenerateToken(64);

                _nguoiDungbll.Create(model);

                var thamso = _thamsobll.GetByMa("NAME");
                _emailbll.SendConfirmationEmail(model.Email, model.ConfirmationLink, model.Token, thamso.NoiDung);

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

        [Authorize]
        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromForm] NguoiDungModel model)
        {
            try
            {
                // Kiểm tra xem người dùng có tải lên một ảnh mới không
                if (model.File != null && model.File.Length > 0)
                {
                    if (model.File.Length > 5 * 1024 * 1024) // Kiểm tra kích thước tệp, 5MB
                    {
                        return BadRequest(new { success = false, message = "Kích thước tệp ảnh không được vượt quá 5MB." });
                    }

                    // Tạo tên file duy nhất bằng cách kết hợp GUID và tên file gốc
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + model.File.FileName;

                    // Kết hợp đường dẫn thư mục lưu trữ ảnh và tên file duy nhất để tạo đường dẫn đầy đủ
                    string filePath = Path.Combine(_path, uniqueFileName);

                    // Lưu file ảnh vào thư mục được chỉ định
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        model.File.CopyTo(stream); // Copy dữ liệu file vào stream
                    }

                    model.Anh = System.IO.File.ReadAllBytes(filePath);
                }

                // Mã hoá mật khẩu nếu nó được cung cấp
                if (!string.IsNullOrEmpty(model.MatKhau))
                {
                    model.MatKhau = CalculateMD5Hash(model.MatKhau);
                }

                _nguoiDungbll.Update(model);

                return Ok(new { success = true, message = "Cập nhật thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Authorize(Roles = "1")]
        [Route("delete/{id}")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            try
            {
                var model = _nguoiDungbll.GetByID(id);

                if (model == null)
                {
                    return NotFound(new { success = false, message = "Người dùng không tồn tại" });
                }

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
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            using (var rng = new RNGCryptoServiceProvider())
            {
                var bytes = new byte[length];
                rng.GetBytes(bytes);
                var charArray = new char[length];
                for (int i = 0; i < length; i++)
                {
                    charArray[i] = chars[bytes[i] % chars.Length];
                }
                return new string(charArray);
            }
        }
    }
}
