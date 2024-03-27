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
    public class DonHangBLL : IDonHangBLL
    {
        private IDonHangDAL _res;
        public DonHangBLL(IDonHangDAL res)
        {
            _res = res;
        }
        public List<DonHangModel> GetByNguoiDung(int pageIndex, int pageSize, out int total, int? id)
        {
            return _res.GetByNguoiDung(pageIndex, pageSize, out total, id);
        }
        public List<DonHangModel> GetAll(int pageIndex, int pageSize, out int total, int? ID, int? TrangThai)
        {
            return _res.GetAll(pageIndex, pageSize, out total, ID, TrangThai);
        }
        public DonHangModel GetNew()
        {
            return _res.GetNew();
        }
        public DonHangModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(DonHangModel model)
        {
            return _res.Create(model);
        }
        public bool Update(DonHangModel model)
        {
            return _res.Update(model);
        }
    }
}
