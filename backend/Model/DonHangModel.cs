using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DonHangModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? DiaChi { get; set; }
        public string? SDT { get; set; }
        public DateTime? NgayDat { get; set; }
        public int KieuGiaoHang { get; set; }
        public string? GhiChu { get; set; }
        public int? TrangThai { get; set; }
        public int? IDPhuongThuc { get; set; }
        public int? IDNguoiDung { get; set; }
        public string? TenPhuongThuc { get; set; }
        public string? TaiKhoan { get; set; }
        public long TongTien { get; set; }
    }
    public class ChiTietDonHangModel
    {
        public int ID { get; set; }
        public int SoLuong { get; set; }
        public long Gia { get; set; }
        public int IDSanPham { get; set; }
        public int IDDonHang { get; set; }
        public string? TenSanPham { get; set; }
        public string? Anh { get; set; }
    }
}
