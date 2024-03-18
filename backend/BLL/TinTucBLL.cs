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
    public class TinTucBLL : ITinTucBLL
    {
        private ITinTucDAL _res;
        public TinTucBLL(ITinTucDAL res)
        {
            _res = res;
        }
        public List<TinTucModel> Get(int pageIndex, int pageSize, out int total)
        {
            return _res.Get(pageIndex, pageSize, out total);
        }
        public List<TinTucModel> GetAll(int pageIndex, int pageSize, out int total, string TieuDe)
        {
            return _res.GetAll(pageIndex, pageSize, out total, TieuDe);
        }
        public List<TinTucModel> GetRandom(int sl)
        {
            return _res.GetRandom(sl);
        }
        public TinTucModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(TinTucModel model)
        {
            return _res.Create(model);
        }
        public bool Update(TinTucModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
