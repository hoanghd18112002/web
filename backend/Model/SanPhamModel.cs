using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SanPhamModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? MoTa { get; set; }
        public int? SoLuong { get; set; }
        public string? Anh { get; set; }
        public DateTime? NgayTao { get; set; }
        public int? TrangThai { get; set; }
        public int? IDNhaSanXuat { get; set; }
        public int? IDLoai { get; set; }
        public int? Gia { get; set; }
        public int? PhanTram { get; set; }
        public int? GiaGiamGia { get; set; }
        public string? TenNhaSanXuat { get; set; }
        public string? TenLoai { get; set; }
        public IFormFile? File { get; set; }
    }
    public class GiaSanPhamModel
    {
        public int ID { get; set; }
        public long Gia { get; set; }
        public DateTime? NgayBatDau { get; set; }
        public DateTime? NgayKetThuc { get; set; }
        public int? IDSanPham { get; set; }
        public string? TenSanPham { get; set; }
    }
    public class ThongSoModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? MoTa { get; set; }
        public int IDSanPham { get; set; }
    }
}