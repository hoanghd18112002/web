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
    public class MenuBLL : IMenuBLL
    {
        private IMenuDAL _res;
        public MenuBLL(IMenuDAL res)
        {
            _res = res;
        }
        public List<MenuModel> Get()
        {
            return _res.Get();
        }
        public List<MenuModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public MenuModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(MenuModel model)
        {
            return _res.Create(model);
        }
        public bool Update(MenuModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
