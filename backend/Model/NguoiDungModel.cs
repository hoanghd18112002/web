using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class NguoiDungModel
    {
        public int ID { get; set; }
        public string? TaiKhoan { get; set; }
        public string? MatKhau { get; set; }
        public string? Email { get; set; }
        public string? Ten { get; set; }
        public DateTime? NgayTao { get; set; }
        public string? DiaChi { get; set; }
        public string? SDT { get; set; }
        public int? GioiTinh { get; set; }
        public string? Anh { get; set; }
        public int? TrangThai { get; set; }
        public int? IDQuyen { get; set; }
        public string? TenQuyen { get; set; }
        public IFormFile? File { get; set; }
        public string? Token { get; set; }
        public bool? EmailConfimed { get; set; }
        public string? ConfirmationLink { get; set; }
    }
}
