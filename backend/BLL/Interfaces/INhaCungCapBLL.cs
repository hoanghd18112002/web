using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INhaCungCapBLL
    {
        List<NhaCungCapModel> Get();
        List<NhaCungCapModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        NhaCungCapModel GetByID(int id);
        bool Create(NhaCungCapModel model);
        bool Update(NhaCungCapModel model);
        bool Delete(int id);
    }
}
