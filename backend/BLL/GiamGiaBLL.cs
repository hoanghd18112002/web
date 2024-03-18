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
    public class GiamGiaBLL : IGiamGiaBLL
    {
        private IGiamGiaDAL _res;
        public GiamGiaBLL(IGiamGiaDAL res)
        {
            _res = res;
        }
        public List<GiamGiaModel> GetBySanPham(int id)
        {
            return _res.GetBySanPham(id);
        }
        public List<GiamGiaModel> GetAll(int pageIndex, int pageSize, out int total)
        {
            return _res.GetAll(pageIndex, pageSize, out total);
        }
        public GiamGiaModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(GiamGiaModel model)
        {
            return _res.Create(model);
        }
        public bool Update(GiamGiaModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
