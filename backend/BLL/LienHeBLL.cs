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
    public class LienHeBLL : ILienHeBLL
    {
        private ILienHeDAL _res;
        public LienHeBLL(ILienHeDAL res)
        {
            _res = res;
        }
        public List<LienHeModel> Get()
        {
            return _res.Get();
        }
        public List<LienHeModel> GetAll(int pageIndex, int pageSize, out int total, string NoiDung)
        {
            return _res.GetAll(pageIndex, pageSize, out total, NoiDung);
        }
        public LienHeModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(LienHeModel model)
        {
            return _res.Create(model);
        }
        public bool Update(LienHeModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
