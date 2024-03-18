using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IChiTietDonHangBLL
    {
        List<ChiTietDonHangModel> GetByDonHang(int id);
        ChiTietDonHangModel GetByID(int id);
        bool Create(ChiTietDonHangModel model);
    }
}
