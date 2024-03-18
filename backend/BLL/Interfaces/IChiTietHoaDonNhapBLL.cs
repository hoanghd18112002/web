using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IChiTietHoaDonNhapBLL
    {
        List<ChiTietHoaDonNhapModel> GetByHoaDonNhap(int id);
        ChiTietHoaDonNhapModel GetByID(int id);
        bool Create(ChiTietHoaDonNhapModel model);
        bool Update(ChiTietHoaDonNhapModel model);
        bool Delete(int id);
    }
}
