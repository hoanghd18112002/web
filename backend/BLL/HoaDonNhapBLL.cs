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
    public class HoaDonNhapBLL : IHoaDonNhapBLL
    {
        private IHoaDonNhapDAL _res;
        public HoaDonNhapBLL(IHoaDonNhapDAL res)
        {
            _res = res;
        }
        public List<HoaDonNhapModel> GetAll(int pageIndex, int pageSize, out int total)
        {
            return _res.GetAll(pageIndex, pageSize, out total);
        }
        public HoaDonNhapModel GetNew()
        {
            return _res.GetNew();
        }
        public HoaDonNhapModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(HoaDonNhapModel model)
        {
            return _res.Create(model);
        }
        public bool Update(HoaDonNhapModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
