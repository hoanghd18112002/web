using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IDonHangBLL
    {
        List<DonHangModel> GetByNguoiDung(int pageIndex, int pageSize, out int total, int? id);
        List<DonHangModel> GetAll(int pageIndex, int pageSize, out int total, int? ID, int? TrangThai);
        DonHangModel GetNew();
        DonHangModel GetByID(int id);
        bool Create(DonHangModel model);
        bool Update(DonHangModel model);
    }
}
