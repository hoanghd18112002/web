using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.IO;

namespace Backend.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ChiTietDonHangController : ControllerBase
    {
        private IChiTietDonHangBLL _chitietdonhangbll;
        private IDonHangBLL _donhangbll;

        public ChiTietDonHangController(IChiTietDonHangBLL chitietdonhangbll, IDonHangBLL donhangbll)
        {
            _chitietdonhangbll = chitietdonhangbll;
            _donhangbll = donhangbll;
        }

        [Route("get-by-don-hang/{id}")]
        [HttpGet]
        public IActionResult GetByDonHang(int id)
        {
            try
            {
                var kq = _chitietdonhangbll.GetByDonHang(id);
                return Ok(new { success = true, message = "Lấy theo đơn hàng thành công", data = kq });
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
                var kq = _chitietdonhangbll.GetByID(id);
                return Ok(new { success = true, message = "Lấy theo ID thành công", data = kq });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        [Route("create")]
        [HttpPost]
        public IActionResult Create([FromBody] ChiTietDonHangModel model)
        {
            try
            {
                _chitietdonhangbll.Create(model);
                return Ok(new { success = true, message = "Tạo mới thành công" });
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
                // Lấy thông tin đơn hàng và chi tiết đơn hàng từ BLL
                var donHang = _donhangbll.GetByID(id);
                var chiTietDonHang = _chitietdonhangbll.GetByDonHang(id);

                using (var package = new ExcelPackage())
                {
                    // Tạo một trang tính mới
                    var worksheet = package.Workbook.Worksheets.Add("Hoá Đơn");

                    // Thêm thông tin cửa hàng và hoá đơn vào các ô
                    worksheet.Cells["A1"].Value = "Cửa hàng điện máy GALIO";
                    worksheet.Cells["A2"].Value = "Tài khoản: " + donHang.TaiKhoan;
                    worksheet.Cells["A3"].Value = "Tên: " + donHang.Ten;
                    worksheet.Cells["A4"].Value = "Địa chỉ: " + donHang.DiaChi;

                    string kieuGiaoHangText = donHang.KieuGiaoHang switch
                    {
                        1 => "Giao hàng thông thường",
                        2 => "Giao hàng tiết kiệm",
                        3 => "Giao hàng nhanh"
                    };

                    worksheet.Cells["A5"].Value = "Giao hàng: " + kieuGiaoHangText;
                    worksheet.Cells["A6"].Value = "Thanh toán: " + donHang.TenPhuongThuc;
                    worksheet.Cells["A7"].Value = "Ghi chú: "+ donHang.GhiChu;

                    worksheet.Cells["D2"].Value = "Mã đơn hàng: " + donHang.ID;
                    worksheet.Cells["D3"].Value = "Ngày đặt: " + donHang.NgayDat;
                    worksheet.Cells["D4"].Value = "Số điện thoại: " + donHang.SDT;

                    string trangThaiText = donHang.TrangThai switch
                    {
                        0 => "Đang xử lý",
                        1 => "Đã duyệt",
                        2 => "Đã huỷ",
                        3 => "Chưa thanh toán",
                        4 => "Đã thanh toán",
                        5 => "Đang giao",
                        6 => "Đã nhận hàng"
                    };

                    worksheet.Cells["D5"].Value = "Trạng thái: " + trangThaiText;

                    worksheet.Cells["A8"].Value = "STT";
                    worksheet.Cells["B8"].Value = "Tên sản phẩm";
                    worksheet.Cells["C8"].Value = "Số lượng";
                    worksheet.Cells["D8"].Value = "Giá";
                    worksheet.Cells["E8"].Value = "Thành tiền";

                    // Duyệt qua danh sách chi tiết đơn hàng và ghi dữ liệu vào worksheet
                    int rowIndex = 9; // Bắt đầu từ hàng thứ 9 sau các thông tin cửa hàng
                    foreach (var item in chiTietDonHang)
                    {
                        worksheet.Cells[rowIndex, 1].Value = rowIndex - 8;
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
                    worksheet.Cells["A5:C5"].Merge = true;
                    worksheet.Cells["A6:C6"].Merge = true;
                    worksheet.Cells["A7:E7"].Merge = true;
                    worksheet.Cells["D2:E2"].Merge = true;
                    worksheet.Cells["D3:E3"].Merge = true;
                    worksheet.Cells["D4:E4"].Merge = true;
                    worksheet.Cells["D5:E5"].Merge = true;
                    worksheet.Cells["D6:E6"].Merge = true;

                    worksheet.Cells["A1:E1"].Style.Font.Bold = true; // Đặt in đậm cho font
                    worksheet.Cells["A1:E1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center; // Căn chỉnh giữa
                    worksheet.Cells["A8:E8"].Style.Font.Bold = true; // Đặt in đậm cho tiêu đề các cột
                    worksheet.Cells["A8:E8"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                    // Đặt giá trị cho ô "Tổng hoá đơn" sau khi đã lặp qua danh sách chi tiết đơn hàng
                    worksheet.Cells["A" + rowIndex].Value = "Tổng hoá đơn: " + donHang.TongTien.ToString("#,##0") + " VNĐ";
                    worksheet.Cells["A" + rowIndex + ":E" + rowIndex].Merge = true; // Gộp ô từ A đến E tại hàng cuối cùng
                    worksheet.Cells["A" + rowIndex].Style.Font.Bold = true;

                    // Tự động điều chỉnh chiều rộng của các cột
                    worksheet.Cells.AutoFitColumns();

                    // Chuyển đổi package Excel thành một mảng byte
                    var fileBytes = package.GetAsByteArray();
                    return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "donhang.xlsx");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }

        //[Route("excel/{id}")]
        //[HttpGet]
        //public IActionResult ExportToExcel(int id)
        //{
        //    try
        //    {
        //        var kq = _chitietdonhangbll.GetByDonHang(id);

        //        using (var package = new ExcelPackage())
        //        {
        //            var worksheet = package.Workbook.Worksheets.Add("donhang");
        //            worksheet.Cells[1, 1].Value = "STT";
        //            worksheet.Cells[1, 2].Value = "Tên sản phẩm";
        //            worksheet.Cells[1, 3].Value = "Số lượng";
        //            worksheet.Cells[1, 4].Value = "Giá";

        //            int rowIndex = 2;
        //            foreach (var item in kq)
        //            {
        //                worksheet.Cells[rowIndex, 1].Value = rowIndex - 1;
        //                worksheet.Cells[rowIndex, 2].Value = item.TenSanPham;
        //                worksheet.Cells[rowIndex, 3].Value = item.SoLuong;
        //                worksheet.Cells[rowIndex, 4].Value = item.Gia;
        //                rowIndex++;
        //            }

        //            var fileBytes = package.GetAsByteArray();
        //            return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "donhang.xlsx");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
        //    }
        //}
    }
}
