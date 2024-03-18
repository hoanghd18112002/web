using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IGiamGiaBLL
    {
        List<GiamGiaModel> GetBySanPham(int id);
        List<GiamGiaModel> GetAll(int pageIndex, int pageSize, out int total);
        GiamGiaModel GetByID(int id);
        bool Create(GiamGiaModel model);
        bool Update(GiamGiaModel model);
        bool Delete(int id);
    }
}
