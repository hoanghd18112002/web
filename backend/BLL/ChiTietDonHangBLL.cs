using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ChiTietDonHangBLL : IChiTietDonHangBLL
    {
        private IChiTietDonHangDAL _res;
        public ChiTietDonHangBLL(IChiTietDonHangDAL res)
        {
            _res = res;
        }
        public List<ChiTietDonHangModel> GetByDonHang(int id)
        {
            return _res.GetByDonHang(id);
        }
        public ChiTietDonHangModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(ChiTietDonHangModel model)
        {
            return _res.Create(model);
        }
    }
}
