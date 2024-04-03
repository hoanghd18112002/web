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
    public class ThamSoBLL : IThamSoBLL
    {
        private IThamSoDAL _res;
        public ThamSoBLL(IThamSoDAL res)
        {
            _res = res;
        }
        public ThamSoModel GetByMa(string Ma)
        {
            return _res.GetByMa(Ma);
        }
        public List<ThamSoModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public ThamSoModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(ThamSoModel model)
        {
            return _res.Create(model);
        }
        public bool Update(ThamSoModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
