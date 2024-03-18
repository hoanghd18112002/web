using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IDieuKhoanBLL
    {
        List<DieuKhoanModel> GetByKieu(int Kieu);
        List<DieuKhoanModel> GetAll(int pageIndex, int pageSize, out int total, int? Kieu);
        DieuKhoanModel GetByID(int id);
        bool Create(DieuKhoanModel model);
        bool Update(DieuKhoanModel model);
        bool Delete(int id);
    }
}
