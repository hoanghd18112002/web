using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IMenuDAL
    {
        List<MenuModel> Get();
        List<MenuModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        MenuModel GetByID(int id);
        bool Create(MenuModel model);
        bool Update(MenuModel model);
        bool Delete(int id);
    }
}
