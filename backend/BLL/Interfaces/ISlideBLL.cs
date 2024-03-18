using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ISlideBLL
    {
        List<SlideModel> Get();
        List<SlideModel> GetAll(int pageIndex, int pageSize, out int total);
        SlideModel GetByID(int id);
        bool Create(SlideModel model);
        bool Update(SlideModel model);
        bool Delete(int id);
    }
}
