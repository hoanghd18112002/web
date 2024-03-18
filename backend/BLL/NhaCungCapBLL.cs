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
    public class NhaCungCapBLL : INhaCungCapBLL
    {
        private INhaCungCapDAL _res;
        public NhaCungCapBLL(INhaCungCapDAL res)
        {
            _res = res;
        }
        public List<NhaCungCapModel> Get()
        {
            return _res.Get();
        }
        public List<NhaCungCapModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public NhaCungCapModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(NhaCungCapModel model)
        {
            return _res.Create(model);
        }
        public bool Update(NhaCungCapModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
