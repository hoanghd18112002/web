using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IThongKeBLL
    {
        List<DoanhThuTheoThangModel> DoanhThuTheoThang(int sl);
        List<DoanhThuSanPhamModel> DoanhThuSanPham(int sl);
        List<LoaiSanPhamBanChayModel> LoaiSanPhamBanChay(int sl);
        List<SoLuongModel> SoLuong();
    }
}
