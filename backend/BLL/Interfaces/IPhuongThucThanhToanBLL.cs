using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IPhuongThucThanhToanBLL
    {
        List<PhuongThucThanhToanModel> Get();
        List<PhuongThucThanhToanModel> GetAll(int pageIndex, int pageSize, out int total, string Ten);
        PhuongThucThanhToanModel GetByID(int id);
        bool Create(PhuongThucThanhToanModel model);
        bool Update(PhuongThucThanhToanModel model);
        bool Delete(int id);
    }
}
