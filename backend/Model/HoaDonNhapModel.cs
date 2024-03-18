using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class HoaDonNhapModel
    {
        public int ID { get; set; }
        public DateTime? NgayNhap { get; set; }
        public int? IDNhaCungCap { get; set; }
        public int? IDNguoiDung { get; set; }
        public string? TenNhaCungCap { get; set; }
        public string? TenNguoiDung { get; set; }
        public long TongTien { get; set; }
    }
    public class ChiTietHoaDonNhapModel
    {
        public int ID { get; set; }
        public int SoLuong { get; set; }
        public long Gia { get; set; }
        public int IDSanPham { get; set; }
        public int IDHoaDonNhap { get; set; }
        public string? TenSanPham { get; set; }
        public string? Anh { get; set; }
    }
}
