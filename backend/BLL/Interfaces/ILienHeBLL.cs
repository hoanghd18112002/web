using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ILienHeBLL
    {
        List<LienHeModel> Get();
        List<LienHeModel> GetAll(int pageIndex, int pageSize, out int total, string NoiDung);
        LienHeModel GetByID(int id);
        bool Create(LienHeModel model);
        bool Update(LienHeModel model);
        bool Delete(int id);
    }
}
