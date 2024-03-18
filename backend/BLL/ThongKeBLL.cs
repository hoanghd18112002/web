using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ThongKeBLL : IThongKeBLL
    {
        private IThongKeDAL _res;
        public ThongKeBLL(IThongKeDAL res)
        {
            _res = res;
        }
        public List<DoanhThuTheoThangModel> DoanhThuTheoThang(int sl)
        {
            return _res.DoanhThuTheoThang(sl);
        }
        public List<DoanhThuSanPhamModel> DoanhThuSanPham(int sl)
        {
            return _res.DoanhThuSanPham(sl);
        }
        public List<LoaiSanPhamBanChayModel> LoaiSanPhamBanChay(int sl)
        {
            return _res.LoaiSanPhamBanChay(sl);
        }
        public List<SoLuongModel> SoLuong()
        {
            return _res.SoLuong();
        }
    }
}
