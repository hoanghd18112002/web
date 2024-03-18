using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IGiaSanPhamBLL
    {
        List<GiaSanPhamModel> GetBySanPham(int id);
        List<GiaSanPhamModel> GetAll(int pageIndex, int pageSize, out int total);
        GiaSanPhamModel GetByID(int id);
        bool Create(GiaSanPhamModel model);
        bool Update(GiaSanPhamModel model);
        bool Delete(int id);
    }
}
