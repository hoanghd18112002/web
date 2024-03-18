using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IGioiThieuDAL
    {
        List<GioiThieuModel> Get();
        List<GioiThieuModel> GetAll(int pageIndex, int pageSize, out int total, string NoiDung);
        GioiThieuModel GetByID(int id);
        bool Create(GioiThieuModel model);
        bool Update(GioiThieuModel model);
        bool Delete(int id);
    }
}
