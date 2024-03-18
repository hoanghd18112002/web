using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class GiamGiaModel
    {
        public int ID { get; set; }
        public string? PhanTram { get; set; }
        public DateTime? NgayBatDau { get; set; }
        public DateTime? NgayKetThuc { get; set; }
        public int IDSanPham { get; set; }
        public string? TenSanPham { get; set; }
    }
}
