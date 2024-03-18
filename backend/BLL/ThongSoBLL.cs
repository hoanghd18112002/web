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
    public class ThongSoBLL : IThongSoBLL
    {
        private IThongSoDAL _res;
        public ThongSoBLL(IThongSoDAL res)
        {
            _res = res;
        }
        public List<ThongSoModel> GetBySanPham(int id)
        {
            return _res.GetBySanPham(id);
        }
        public ThongSoModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(ThongSoModel model)
        {
            return _res.Create(model);
        }
        public bool Update(ThongSoModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
        public bool DeleteBySanPham(int id)
        {
            return _res.DeleteBySanPham(id);
        }
    }
}
