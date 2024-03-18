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
    public class PhuongThucThanhToanBLL : IPhuongThucThanhToanBLL
    {
        private IPhuongThucThanhToanDAL _res;
        public PhuongThucThanhToanBLL(IPhuongThucThanhToanDAL res)
        {
            _res = res;
        }
        public List<PhuongThucThanhToanModel> Get()
        {
            return _res.Get();
        }
        public List<PhuongThucThanhToanModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public PhuongThucThanhToanModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(PhuongThucThanhToanModel model)
        {
            return _res.Create(model);
        }
        public bool Update(PhuongThucThanhToanModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
