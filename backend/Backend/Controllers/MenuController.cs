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
    public class MenuController : ControllerBase
    {
        private IMenuBLL _bll;
        public MenuController(IMenuBLL bll)
        {
            _bll = bll;
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
        public IActionResult Create([FromBody] MenuModel model)
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
        public IActionResult Update([FromBody] MenuModel model)
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

        [Route("delete/{id}")]
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            try
            {
                bool result = _bll.Delete(id);
                return Ok(new { success = true, message = "Xóa thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        private List<MenuModel> BuildTree(List<MenuModel> menuItems)
        {
            var menuMap = new Dictionary<int, MenuModel>();
            var rootItems = new List<MenuModel>();

            foreach (var menuItem in menuItems)
            {
                var menuNode = new MenuModel
                {
                    ID = menuItem.ID,
                    Ten = menuItem.Ten,
                    Link = menuItem.Link,
                    TrangThai = menuItem.TrangThai,
                    IDCha = menuItem.IDCha,
                    Children = new List<MenuModel>()
                };
                menuMap[menuItem.ID] = menuNode;

                if (menuItem.IDCha == 0)
                {
                    rootItems.Add(menuNode);
                }
                else
                {
                    if (!menuMap.ContainsKey(menuItem.IDCha))
                    {

                    }
                    else
                    {
                        menuMap[menuItem.IDCha].Children.Add(menuNode);
                    }
                }
            }

            return rootItems;
        }
    }
}
