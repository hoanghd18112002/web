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
    public class GiaSanPhamBLL : IGiaSanPhamBLL
    {
        private IGiaSanPhamDAL _res;
        public GiaSanPhamBLL(IGiaSanPhamDAL res)
        {
            _res = res;
        }
        public List<GiaSanPhamModel> GetBySanPham(int id)
        {
            return _res.GetBySanPham(id);
        }
        public List<GiaSanPhamModel> GetAll(int pageIndex, int pageSize, out int total)
        {
            return _res.GetAll(pageIndex, pageSize, out total);
        }
        public GiaSanPhamModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(GiaSanPhamModel model)
        {
            return _res.Create(model);
        }
        public bool Update(GiaSanPhamModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
