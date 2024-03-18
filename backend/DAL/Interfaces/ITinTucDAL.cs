using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface ITinTucDAL
    {
        List<TinTucModel> Get(int pageIndex, int pageSize, out int total);
        List<TinTucModel> GetAll(int pageIndex, int pageSize, out int total, string TieuDe);
        List<TinTucModel> GetRandom(int sl);
        TinTucModel GetByID(int id);
        bool Create(TinTucModel model);
        bool Update(TinTucModel model);
        bool Delete(int id);
    }
}
