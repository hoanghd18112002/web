using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IThamSoBLL
    {
        ThamSoModel GetByMa(string Ma);
        List<ThamSoModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        ThamSoModel GetByID(int id);
        bool Create(ThamSoModel model);
        bool Update(ThamSoModel model);
        bool Delete(int id);
    }
}
