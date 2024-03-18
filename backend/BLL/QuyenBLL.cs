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
    public class QuyenBLL : IQuyenBLL
    {
        private IQuyenDAL _res;
        public QuyenBLL(IQuyenDAL res)
        {
            _res = res;
        }
        public List<QuyenModel> Get()
        {
            return _res.Get();
        }
        public List<QuyenModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public QuyenModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(QuyenModel model)
        {
            return _res.Create(model);
        }
        public bool Update(QuyenModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
