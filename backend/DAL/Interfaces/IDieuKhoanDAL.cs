using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IDieuKhoanDAL
    {
        List<DieuKhoanModel> GetByKieu(int Kieu);
        List<DieuKhoanModel> GetAll(int pageIndex, int pageSize, out int total, int? Kieu);
        DieuKhoanModel GetByID(int id);
        bool Create(DieuKhoanModel model);
        bool Update(DieuKhoanModel model);
        bool Delete(int id);
    }
}
