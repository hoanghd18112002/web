using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace Backend.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private IDonHangBLL _bll;
        public DonHangController(IDonHangBLL bll)
        {
            _bll = bll;
        }

        [Route("get-by-nguoi-dung")]
        [HttpPost]
        public IActionResult GetByNguoiDung([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? id = null;

                if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"])))
                {
                    id = int.Parse(formData["id"].ToString());
                }

                int total = 0;
                var data = _bll.GetByNguoiDung(page, pageSize, out total, id);

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

        [Route("get-all")]
        [HttpPost]
        public IActionResult GetAll([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? id = null;

                if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"])))
                {
                    id = int.Parse(formData["id"].ToString());
                }

                int? trangThai = null;

                if (formData.Keys.Contains("trangThai") && !string.IsNullOrEmpty(Convert.ToString(formData["trangThai"])))
                {
                    trangThai = int.Parse(formData["trangThai"].ToString());
                }

                int total = 0;
                var data = _bll.GetAll(page, pageSize, out total, id, trangThai);

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
        public IActionResult Create([FromBody] DonHangModel model)
        {
            try
            {
                _bll.Create(model);
                return Ok(new { success = true, message = "Tạo mới thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromBody] DonHangModel model)
        {
            try
            {
                _bll.Update(model);
                return Ok(new { success = true, message = "Cập nhật thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
    }
}
