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
    public class NhaSanXuatBLL : INhaSanXuatBLL
    {
        private INhaSanXuatDAL _res;
        public NhaSanXuatBLL(INhaSanXuatDAL res)
        {
            _res = res;
        }
        public List<NhaSanXuatModel> Get()
        {
            return _res.Get();
        }
        public List<NhaSanXuatModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public NhaSanXuatModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(NhaSanXuatModel model)
        {
            return _res.Create(model);
        }
        public bool Update(NhaSanXuatModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
