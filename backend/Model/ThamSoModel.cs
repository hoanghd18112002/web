using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ThamSoModel
    {
        public int ID { get; set; }
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string? NoiDung { get; set; }
        public string? Anh { get; set; }
        public int TrangThai { get; set; }
        public IFormFile? File { get; set; }
    }
}
