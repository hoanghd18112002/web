using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IKhoDAL
    {
        List<KhoModel> Get();
        List<KhoModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        KhoModel GetByID(int id);
        bool Create(KhoModel model);
        bool Update(KhoModel model);
        bool Delete(int id);
    }
}
