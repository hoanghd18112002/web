using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ChiTietHoaDonNhapBLL : IChiTietHoaDonNhapBLL
    {
        private IChiTietHoaDonNhapDAL _res;
        public ChiTietHoaDonNhapBLL(IChiTietHoaDonNhapDAL res)
        {
            _res = res;
        }
        public List<ChiTietHoaDonNhapModel> GetByHoaDonNhap(int id)
        {
            return _res.GetByHoaDonNhap(id);
        }
        public ChiTietHoaDonNhapModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(ChiTietHoaDonNhapModel model)
        {
            return _res.Create(model);
        }
        public bool Update(ChiTietHoaDonNhapModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
