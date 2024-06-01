﻿using BLL.Interfaces;
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
            _path = configuration["AppSettings:PATH"];
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

                string ten = "";
                if (formData.Keys.Contains("ten") && !string.IsNullOrEmpty(Convert.ToString(formData["ten"]))){ ten = Convert.ToString(formData["ten"].ToString()); }

                int? minGia = null;
                if (formData.Keys.Contains("minGia") && !string.IsNullOrEmpty(Convert.ToString(formData["minGia"]))) { minGia = int.Parse(formData["minGia"].ToString()); }

                int? maxGia = null;
                if (formData.Keys.Contains("maxGia") && !string.IsNullOrEmpty(Convert.ToString(formData["maxGia"]))) { maxGia = int.Parse(formData["maxGia"].ToString()); }

                int? idNhaSanXuat = null;
                if (formData.Keys.Contains("idNhaSanXuat") && !string.IsNullOrEmpty(Convert.ToString(formData["idNhaSanXuat"]))) { idNhaSanXuat = int.Parse(formData["idNhaSanXuat"].ToString()); }

                int? idLoai = null;
                if (formData.Keys.Contains("idLoai") && !string.IsNullOrEmpty(Convert.ToString(formData["idLoai"]))) { idLoai = int.Parse(formData["idLoai"].ToString()); }

                string kieuSapXep = "";
                if (formData.Keys.Contains("kieuSapXep") && !string.IsNullOrEmpty(Convert.ToString(formData["kieuSapXep"]))) { kieuSapXep = Convert.ToString(formData["kieuSapXep"].ToString()); }

                int total = 0;
                var data = _bll.Search(page, pageSize, out total, ten, minGia, maxGia, idNhaSanXuat, idLoai, kieuSapXep);

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

                    var Model = new SanPhamModel
                    {
                        Ten = model.Ten,
                        MoTa = model.MoTa,
                        Anh = System.IO.File.ReadAllBytes(filePath), // Chuyển đổi tệp ảnh thành mảng byte
                        TrangThai = model.TrangThai,
                        IDNhaSanXuat = model.IDNhaSanXuat,
                        IDLoai = model.IDLoai
                    };

                    if (!string.IsNullOrEmpty(uniqueFileName))
                    {
                        string filePathDelete = Path.Combine(_path, uniqueFileName);
                        if (System.IO.File.Exists(filePathDelete))
                        {
                            System.IO.File.Delete(filePathDelete);
                        }
                    }

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

                    if (!string.IsNullOrEmpty(uniqueFileName))
                    {
                        string filePathDelete = Path.Combine(_path, uniqueFileName);
                        if (System.IO.File.Exists(filePathDelete))
                        {
                            System.IO.File.Delete(filePathDelete);
                        }
                    }
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
                    return NotFound(new { success = false, message = "Sản phẩm không tồn tại" });
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
    }
}
