using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace Backend.Controllers
{
    [Authorize(Roles = "1, 3")]
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBLL _bll;
        private string _path;
        public SanPhamController(ISanPhamBLL bll, IConfiguration configuration)
        {
            _bll = bll;
            _path = configuration["AppSettings:PATH_SANPHAM"];
        }

        [AllowAnonymous]
        [Route("get-san-pham-moi/{sl}")]
        [HttpGet]
        public IActionResult GetSanPhamMoi(int sl)
        {
            try
            {
                var kq = _bll.GetSanPhamMoi(sl);
                return Ok(new
                {
                    success = true,
                    message = "Lấy dữ liệu thành công",
                    data = kq
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [AllowAnonymous]
        [Route("get-san-pham-ban-chay/{sl}")]
        [HttpGet]
        public IActionResult GetSanPhamBanChay(int sl)
        {
            try
            {
                var kq = _bll.GetSanPhamBanChay(sl);
                return Ok(new
                {
                    success = true,
                    message = "Lấy dữ liệu thành công",
                    data = kq
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [AllowAnonymous]
        [Route("get-san-pham-giam-gia/{sl}")]
        [HttpGet]
        public IActionResult GetSanPhamGiamGia(int sl)
        {
            try
            {
                var kq = _bll.GetSanPhamGiamGia(sl);
                return Ok(new
                {
                    success = true,
                    message = "Lấy dữ liệu thành công",
                    data = kq
                });
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

                if (formData.Keys.Contains("ten") && !string.IsNullOrEmpty(Convert.ToString(formData["ten"])))
                {
                    ten = Convert.ToString(formData["ten"].ToString());
                }

                int total = 0;
                var data = _bll.GetAll(page, pageSize, out total, ten);

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
        [Route("get-random/{sl}")]
        [HttpGet]
        public IActionResult GetRandom(int sl)
        {
            try
            {
                var kq = _bll.GetRandom(sl);
                return Ok(new
                {
                    success = true,
                    message = "Lấy dữ liệu thành công",
                    data = kq
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [AllowAnonymous]
        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());

                int? id = null;
                if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = int.Parse(formData["id"].ToString()); }

                string ten = "";
                if (formData.Keys.Contains("ten") && !string.IsNullOrEmpty(Convert.ToString(formData["ten"]))){ ten = Convert.ToString(formData["ten"].ToString()); }

                string tenNhaSanXuat = "";
                if (formData.Keys.Contains("tenNhaSanXuat") && !string.IsNullOrEmpty(Convert.ToString(formData["tenNhaSanXuat"]))) { tenNhaSanXuat = Convert.ToString(formData["tenNhaSanXuat"].ToString()); }

                string tenLoai = "";
                if (formData.Keys.Contains("tenLoai") && !string.IsNullOrEmpty(Convert.ToString(formData["tenLoai"]))) { tenLoai = Convert.ToString(formData["tenLoai"].ToString()); }

                int? minGia = null;
                if (formData.Keys.Contains("minGia") && !string.IsNullOrEmpty(Convert.ToString(formData["minGia"]))) { minGia = int.Parse(formData["minGia"].ToString()); }

                int? maxGia = null;
                if (formData.Keys.Contains("maxGia") && !string.IsNullOrEmpty(Convert.ToString(formData["maxGia"]))) { maxGia = int.Parse(formData["maxGia"].ToString()); }

                int? idNhaSanXuat = null;
                if (formData.Keys.Contains("idNhaSanXuat") && !string.IsNullOrEmpty(Convert.ToString(formData["idNhaSanXuat"]))) { idNhaSanXuat = int.Parse(formData["idNhaSanXuat"].ToString()); }

                int? idLoai = null;
                if (formData.Keys.Contains("idLoai") && !string.IsNullOrEmpty(Convert.ToString(formData["idLoai"]))) { idLoai = int.Parse(formData["idLoai"].ToString()); }
                
                int total = 0;
                var data = _bll.Search(page, pageSize, out total, id, ten, tenNhaSanXuat, tenLoai, minGia, maxGia, idNhaSanXuat, idLoai);

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

        [Route("get-new")]
        [HttpGet]
        public IActionResult GetNew()
        {
            try
            {
                var kq = _bll.GetNew();
                return Ok(new { success = true, message = "Lấy ID thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [AllowAnonymous]
        [Route("get-by-id/{id}")]
        [HttpGet]
        public IActionResult GetByID(int id)
        {
            try
            {
                var kq = _bll.GetByID(id);
                return Ok(new { success = true, message = "Lấy theo ID thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("create")]
        [HttpPost]
        public IActionResult Create([FromForm] SanPhamModel model)
        {
            try
            {
                // Khởi tạo biến imagePath
                string imagePath = null;

                // Kiểm tra xem có dữ liệu file ảnh được gửi lên không và có dung lượng lớn hơn 0 không
                if (model.File != null && model.File.Length > 0)
                {
                    // Tạo tên file duy nhất bằng cách kết hợp GUID và tên file gốc
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + model.File.FileName;

                    // Kết hợp đường dẫn thư mục lưu trữ ảnh và tên file duy nhất để tạo đường dẫn đầy đủ
                    string filePath = Path.Combine(_path, uniqueFileName);

                    // Lưu file ảnh vào thư mục được chỉ định
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        model.File.CopyTo(stream); // Copy dữ liệu file vào stream
                    }

                    // Tạo đường dẫn tương đối của ảnh từ thư mục gốc
                    imagePath = uniqueFileName;
                }

                // Tạo đối tượng Model mới với các thông tin
                var Model = new SanPhamModel
                {
                    Ten = model.Ten, 
                    MoTa = model.MoTa, 
                    Anh = imagePath, // Đường dẫn tương đối của ảnh 
                    TrangThai = model.TrangThai, 
                    IDNhaSanXuat = model.IDNhaSanXuat, 
                    IDLoai = model.IDLoai 
                };

                // Gọi phương thức Create từ BLL để thêm mới vào cơ sở dữ liệu
                _bll.Create(Model);

                // Trả về kết quả thành công
                return Ok(new { success = true, message = "Tạo mới thành công" });
            }
            catch (Exception ex)
            {
                // Nếu có lỗi xảy ra, trả về mã lỗi 500 và thông báo lỗi
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromForm] SanPhamModel model)
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

                    var Model = _bll.GetByID(model.ID);

                    // Xoá file ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(Model.Anh))
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

                // Gọi phương thức cập nhật từ BLL với thông tin mới
                _bll.Update(model);

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
                var model = _bll.GetByID(id);

                if (model == null)
                {
                    return NotFound(new { success = false, message = "Sản phẩm không tồn tại" });
                }

                // Xoá file ảnh từ thư mục lưu trữ
                if (!string.IsNullOrEmpty(model.Anh))
                {
                    string filePath = Path.Combine(_path, model.Anh);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                }

                // Xoá từ cơ sở dữ liệu
                bool result = _bll.Delete(id);

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
    }
}
