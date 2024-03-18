using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class KhoModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? DiaChi { get; set; }
        public int TrangThai { get; set; }
    }
    public class ChiTietKhoModel
    {
        public int ID { get; set; }
        public int SoLuong { get; set; }
        public int IDSanPham { get; set; }
        public int IDKho { get; set; }
        public string? TenSanPham { get; set; }
        public string? Anh { get; set; }
    }
}
