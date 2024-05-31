using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ISanPhamBLL
    {
        List<SanPhamModel> GetSanPhamMoi(int sl);
        List<SanPhamModel> GetSanPhamBanChay(int sl);
        List<SanPhamModel> GetSanPhamGiamGia(int sl);
        List<SanPhamModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        List<SanPhamModel> GetRandom(int sl);
        List<SanPhamModel> Search(int pageIndex, int pageSize, out int total, string ten, int? mingia, int? maxgia, int? idnhasanxuat, int? idloai, string kieusapxep);
        SanPhamModel GetNew();
        SanPhamModel GetByID(int id);
        bool Create(SanPhamModel model);
        bool Update(SanPhamModel model);
        bool Delete(int id);
    }
}
