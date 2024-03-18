using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DoanhThuTheoThangModel
    {
        public string? ThoiGian { get; set; }
        public long? DoanhThuTheoThang { get; set; }
    }
    public class DoanhThuSanPhamModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? Anh { get; set; }
        public long? DoanhThu { get; set; }
    }
    public class LoaiSanPhamBanChayModel
    {
        public string? TenLoai { get; set; }
        public int? SoLuong { get; set; }
        public long? DoanhThu { get; set; }
    }
    public class SoLuongModel
    {
        public int? SoLuongSanPham { get; set; }
        public int? SoLuongNguoiDung { get; set; }
        public int? SoLuongDonHang { get; set; }
        public long? DoanhSo { get; set; }
    }
}
