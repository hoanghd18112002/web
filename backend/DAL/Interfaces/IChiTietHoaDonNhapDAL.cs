using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IChiTietHoaDonNhapDAL
    {
        List<ChiTietHoaDonNhapModel> GetByHoaDonNhap(int id);
        ChiTietHoaDonNhapModel GetByID(int id);
        bool Create(ChiTietHoaDonNhapModel model);
        bool Update(ChiTietHoaDonNhapModel model);
        bool Delete(int id);
    }
}
