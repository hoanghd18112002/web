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
    public class SlideController : ControllerBase
    {
        private ISlideBLL _bll;
        private string _path;
        public SlideController(ISlideBLL bll, IConfiguration configuration)
        {
            _bll = bll;
            _path = configuration["AppSettings:PATH_SLIDE"];
        }

        [AllowAnonymous]
        [Route("get")]
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                var kq = _bll.Get();
                var tree = BuildTree(kq);
                return Ok(new { success = true, message = "Lấy dữ liệu thành công", data = tree });
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
                string tieuDe = "";

                if (formData.Keys.Contains("tieuDe") && !string.IsNullOrEmpty(Convert.ToString(formData["tieuDe"])))
                {
                    tieuDe = Convert.ToString(formData["tieuDe"].ToString());
                }

                int total = 0;
                var data = _bll.GetAll(page, pageSize, out total, tieuDe);

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
        public IActionResult Create([FromForm] SlideModel model)
        {
            try
            {
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

                    var Model = new SlideModel
                    {
                        TieuDe = model.TieuDe,
                        NoiDung = model.NoiDung,
                        Anh = System.IO.File.ReadAllBytes(filePath), // Chuyển đổi tệp ảnh thành mảng byte
                        Kieu = model.Kieu,
                        TrangThai = model.TrangThai,
                        IDCha = model.IDCha,
                    };

                    _bll.Create(Model);

                    return Ok(new { success = true, message = "Tạo mới thành công" });
                }
                else
                {
                    return BadRequest(new { success = false, message = "Vui lòng chọn một tệp ảnh." });
                }
            }
            catch (Exception ex)
            {
                // Nếu có lỗi xảy ra, trả về mã lỗi 500 và thông báo lỗi
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromForm] SlideModel model)
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
                var model = _bll.GetByID(id);

                if (model == null)
                {
                    return NotFound(new { success = false, message = "Slide không tồn tại" });
                }

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

        private List<SlideModel> BuildTree(List<SlideModel> slideItems)
        {
            var slideMap = new Dictionary<int, SlideModel>();
            var rootItems = new List<SlideModel>();

            foreach (var slideItem in slideItems)
            {
                var slideNode = new SlideModel
                {
                    ID = slideItem.ID,
                    TieuDe = slideItem.TieuDe,
                    NoiDung = slideItem.NoiDung,
                    Anh = slideItem.Anh,
                    Kieu = slideItem.Kieu,
                    TrangThai = slideItem.TrangThai,
                    IDCha = slideItem.IDCha,
                    Children = new List<SlideModel>()
                };
                slideMap[slideItem.ID] = slideNode;

                if (slideItem.IDCha == 0)
                {
                    rootItems.Add(slideNode);
                }
                else
                {
                    if (!slideMap.ContainsKey(slideItem.IDCha))
                    {

                    }
                    else
                    {
                        slideMap[slideItem.IDCha].Children.Add(slideNode);
                    }
                }
            }

            return rootItems;
        }
    }
}
