using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IQuyenDAL
    {
        List<QuyenModel> Get();
        List<QuyenModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        QuyenModel GetByID(int id);
        bool Create(QuyenModel model);
        bool Update(QuyenModel model);
        bool Delete(int id);
    }
}
