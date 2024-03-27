using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Authorize(Roles = "1, 3")]
    [Route("api/[controller]")]
    [ApiController]
    public class ThongKeController : ControllerBase
    {
        private IThongKeBLL _bll;
        public ThongKeController(IThongKeBLL bll)
        {
            _bll = bll;
        }

        [Route("doanh-thu-theo-thang/{sl}")]
        [HttpGet]
        public IActionResult DoanhThuTheoThang(int sl)
        {
            try
            {
                var kq = _bll.DoanhThuTheoThang(sl);
                return Ok(new { success = true, message = "Lấy dữ liệu thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("doanh-thu-san-pham/{sl}")]
        [HttpGet]
        public IActionResult DoanhThuSanPham(int sl)
        {
            try
            {
                var kq = _bll.DoanhThuSanPham(sl);
                return Ok(new { success = true, message = "Lấy dữ liệu thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("loai-san-pham-ban-chay/{sl}")]
        [HttpGet]
        public IActionResult LoaiSanPhamBanChay(int sl)
        {
            try
            {
                var kq = _bll.LoaiSanPhamBanChay(sl);
                return Ok(new { success = true, message = "Lấy dữ liệu thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("so-luong")]
        [HttpGet]
        public IActionResult SoLuong()
        {
            try
            {
                var kq = _bll.SoLuong();
                return Ok(new { success = true, message = "Lấy dữ liệu thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
    }
}
