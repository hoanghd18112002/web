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
        public VnPayController(IVnPayBLL bll)
        {
            _bll = bll;
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
                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
    }
}
