using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using OfficeOpenXml.Style;
using OfficeOpenXml;

namespace Backend.Controllers
{
    [Authorize(Roles = "1, 3")]
    [Route("api/[controller]")]
    [ApiController]
    public class ChiTietHoaDonNhapController : ControllerBase
    {
        private IChiTietHoaDonNhapBLL _chitiethoadonnhapbll;
        private IHoaDonNhapBLL _hoadonnhapbll;
        public ChiTietHoaDonNhapController(IChiTietHoaDonNhapBLL chitiethoadonnhapbll, IHoaDonNhapBLL hoadonnhapbll)
        {
            _chitiethoadonnhapbll = chitiethoadonnhapbll;
            _hoadonnhapbll = hoadonnhapbll;
        }

        [Route("get-by-hoa-don-nhap/{id}")]
        [HttpGet]
        public IActionResult GetByHoaDonNhap(int id)
        {
            try
            {
                var kq = _chitiethoadonnhapbll.GetByHoaDonNhap(id);
                return Ok(new { success = true, message = "Lấy theo hoá đơn nhập thành công", data = kq });
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
                var kq = _chitiethoadonnhapbll.GetByID(id);
                return Ok(new { success = true, message = "Lấy theo ID thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("create")]
        [HttpPost]
        public IActionResult Create([FromBody] ChiTietHoaDonNhapModel model)
        {
            try
            {
                _chitiethoadonnhapbll.Create(model);
                return Ok(new { success = true, message = "Tạo mới thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("update")]
        [HttpPut]
        public IActionResult Update([FromBody] ChiTietHoaDonNhapModel model)
        {
            try
            {
                _chitiethoadonnhapbll.Update(model);
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
                bool result = _chitiethoadonnhapbll.Delete(id);
                return Ok(new { success = true, message = "Xóa thành công" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("excel/{id}")]
        [HttpGet]
        public IActionResult ExportToExcel(int id)
        {
            try
            {
                // Lấy thông tin hoá đơn nhập và chi tiết hoá đơn nhập từ BLL
                var hoaDonNhap = _hoadonnhapbll.GetByID(id);
                var chiTietHoaDonNhap = _chitiethoadonnhapbll.GetByHoaDonNhap(id);

                using (var package = new ExcelPackage())
                {
                    // Tạo một trang tính mới
                    var worksheet = package.Workbook.Worksheets.Add("Hoá Đơn");

                    // Thêm thông tin cửa hàng và hoá đơn vào các ô
                    worksheet.Cells["A1"].Value = "Cửa hàng điện máy GALIO";
                    worksheet.Cells["A2"].Value = "Tên nhà cung cấp: " + hoaDonNhap.TenNhaCungCap;
                    worksheet.Cells["A3"].Value = "Tên người dùng: " + hoaDonNhap.TenNguoiDung;

                    worksheet.Cells["D2"].Value = "Mã hoá đơn: " + hoaDonNhap.ID;
                    worksheet.Cells["D3"].Value = "Ngày nhập: " + hoaDonNhap.NgayNhap;

                    worksheet.Cells["A5"].Value = "STT";
                    worksheet.Cells["B5"].Value = "Tên sản phẩm";
                    worksheet.Cells["C5"].Value = "Số lượng";
                    worksheet.Cells["D5"].Value = "Giá";
                    worksheet.Cells["E5"].Value = "Thành tiền";

                    // Duyệt qua danh sách chi tiết đơn hàng và ghi dữ liệu vào worksheet
                    int rowIndex = 6; // Bắt đầu từ hàng thứ 9 sau các thông tin cửa hàng
                    foreach (var item in chiTietHoaDonNhap)
                    {
                        worksheet.Cells[rowIndex, 1].Value = rowIndex - 5;
                        worksheet.Cells[rowIndex, 2].Value = item.TenSanPham;
                        worksheet.Cells[rowIndex, 3].Value = item.SoLuong;
                        worksheet.Cells[rowIndex, 4].Value = item.Gia.ToString("#,##0") + " VNĐ";
                        worksheet.Cells[rowIndex, 5].Value = (item.SoLuong * item.Gia).ToString("#,##0") + " VNĐ";
                        rowIndex++;
                    }

                    // Định dạng và thiết kế các ô dữ liệu
                    worksheet.Cells["A1:E1"].Merge = true; // Gộp ô từ A1 đến E1
                    worksheet.Cells["A2:C2"].Merge = true;
                    worksheet.Cells["A3:C3"].Merge = true;
                    worksheet.Cells["A4:C4"].Merge = true;
                    worksheet.Cells["D2:E2"].Merge = true;
                    worksheet.Cells["D3:E3"].Merge = true;
                    worksheet.Cells["D4:E4"].Merge = true;

                    worksheet.Cells["A1:E1"].Style.Font.Bold = true; // Đặt in đậm cho font
                    worksheet.Cells["A1:E1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center; // Căn chỉnh giữa
                    worksheet.Cells["A5:E5"].Style.Font.Bold = true; // Đặt in đậm cho tiêu đề các cột
                    worksheet.Cells["A5:E5"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                    // Đặt giá trị cho ô "Tổng hoá đơn" sau khi đã lặp qua danh sách chi tiết hoá đơn nhập
                    worksheet.Cells["A" + rowIndex].Value = "Tổng hoá đơn: " + hoaDonNhap.TongTien.ToString("#,##0") + " VNĐ";
                    worksheet.Cells["A" + rowIndex + ":E" + rowIndex].Merge = true; // Gộp ô từ A đến E tại hàng cuối cùng
                    worksheet.Cells["A" + rowIndex].Style.Font.Bold = true;

                    // Tự động điều chỉnh chiều rộng của các cột
                    worksheet.Cells.AutoFitColumns();

                    // Chuyển đổi package Excel thành một mảng byte
                    var fileBytes = package.GetAsByteArray();
                    return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "hoadonnhap.xlsx");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
    }
}
