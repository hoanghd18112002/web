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
    public class SlideBLL : ISlideBLL
    {
        private ISlideDAL _res;
        public SlideBLL(ISlideDAL res)
        {
            _res = res;
        }
        public List<SlideModel> Get()
        {
            return _res.Get();
        }
        public List<SlideModel> GetAll(int pageIndex, int pageSize, out int total)
        {
            return _res.GetAll(pageIndex, pageSize, out total);
        }
        public SlideModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(SlideModel model)
        {
            return _res.Create(model);
        }
        public bool Update(SlideModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
