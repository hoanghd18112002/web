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
    public class DieuKhoanBLL : IDieuKhoanBLL
    {
        private IDieuKhoanDAL _res;
        public DieuKhoanBLL(IDieuKhoanDAL res)
        {
            _res = res;
        }
        public List<DieuKhoanModel> GetByKieu(int Kieu)
        {
            return _res.GetByKieu(Kieu);
        }
        public List<DieuKhoanModel> GetAll(int pageIndex, int pageSize, out int total, int? Kieu)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Kieu);
        }
        public DieuKhoanModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(DieuKhoanModel model)
        {
            return _res.Create(model);
        }
        public bool Update(DieuKhoanModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
