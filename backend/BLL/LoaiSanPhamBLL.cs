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
    public class LoaiSanPhamBLL : ILoaiSanPhamBLL
    {
        private ILoaiSanPhamDAL _res;
        public LoaiSanPhamBLL(ILoaiSanPhamDAL res)
        {
            _res = res;
        }
        public List<LoaiSanPhamModel> Get()
        {
            return _res.Get();
        }
        public List<LoaiSanPhamModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public LoaiSanPhamModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(LoaiSanPhamModel model)
        {
            return _res.Create(model);
        }
        public bool Update(LoaiSanPhamModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
