using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SlideModel
    {
        public int ID { get; set; }
        public string? TieuDe { get; set; }
        public string? NoiDung { get; set; }
        public string? Anh { get; set; }
        public int? Kieu { get; set; }
        public int TrangThai { get; set; }
        public int IDCha { get; set; }
        public string? TenSlideCha { get; set; }
        public IFormFile? File { get; set; }
        public List<SlideModel>? Children { get; set; }
    }
}
