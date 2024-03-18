using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface INguoiDungDAL
    {
        NguoiDungModel Login(string TaiKhoan, string MatKhau);
        NguoiDungModel Check(string TaiKhoan, string Email);
        List<NguoiDungModel> GetAll(int pageIndex, int pageSize, out int total, string Ten, int? IDQuyen);
        NguoiDungModel GetByID(int id);
        bool Create(NguoiDungModel model);
        bool Update(NguoiDungModel model);
        bool Delete(int id);
        bool ConfirmEmail(string token);
    }
}
