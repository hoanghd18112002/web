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
    public class VnPayController : ControllerBase
    {
        private IVnPayBLL _bll;
        private IDonHangBLL _blldonhang;
        public VnPayController(IVnPayBLL bll, IDonHangBLL blldonhang)
        {
            _bll = bll;
            _blldonhang = blldonhang;
        }

        [Route("vnpay")]
        [HttpPost]
        public IActionResult CreatePaymentUrl(PaymentInformationModel model)
        {
            try
            {
                var url = _bll.CreatePaymentUrl(model, HttpContext);
                return Ok(new { success = true, message = "Lấy Url thành công", data = url });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }        
        }

        [Route("callback")]
        [HttpGet]
        public IActionResult PaymentCallback()
        {
            try
            {
                var response = _bll.PaymentExecute(Request.Query);
                if (response.Success)
                {
                    DonHangModel model = new DonHangModel();
                    model.ID = int.Parse(response.OrderId);
                    model.TrangThai = 4;
                    _blldonhang.Update(model);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
    }
}
