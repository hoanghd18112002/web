using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ILoaiSanPhamBLL
    {
        List<LoaiSanPhamModel> Get();
        List<LoaiSanPhamModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        LoaiSanPhamModel GetByID(int id);
        bool Create(LoaiSanPhamModel model);
        bool Update(LoaiSanPhamModel model);
        bool Delete(int id);
    }
}
