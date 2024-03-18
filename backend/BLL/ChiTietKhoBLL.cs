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
    public class ChiTietKhoBLL : IChiTietKhoBLL
    {
        private IChiTietKhoDAL _res;
        public ChiTietKhoBLL(IChiTietKhoDAL res)
        {
            _res = res;
        }
        public List<ChiTietKhoModel> GetByKho(int id)
        {
            return _res.GetByKho(id);
        }
        public ChiTietKhoModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(ChiTietKhoModel model)
        {
            return _res.Create(model);
        }
        public bool Update(ChiTietKhoModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
