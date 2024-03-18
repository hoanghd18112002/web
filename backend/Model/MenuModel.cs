using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class MenuModel
    {
        public int ID { get; set; }
        public string? Ten { get; set; }
        public string? Link { get; set; }
        public int TrangThai { get; set; }
        public int IDCha { get; set; }
        public string? TenMenuCha { get; set; }
        public List<MenuModel>? Children { get; set; }
    }
}
