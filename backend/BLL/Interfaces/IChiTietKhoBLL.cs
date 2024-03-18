using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IChiTietKhoBLL
    {
        List<ChiTietKhoModel> GetByKho(int id);
        ChiTietKhoModel GetByID(int id);
        bool Create(ChiTietKhoModel model);
        bool Update(ChiTietKhoModel model);
        bool Delete(int id);
    }
}
