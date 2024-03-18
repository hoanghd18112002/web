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
    public class KhoBLL : IKhoBLL
    {
        private IKhoDAL _res;
        public KhoBLL(IKhoDAL res)
        {
            _res = res;
        }
        public List<KhoModel> Get()
        {
            return _res.Get();
        }
        public List<KhoModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public KhoModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(KhoModel model)
        {
            return _res.Create(model);
        }
        public bool Update(KhoModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
