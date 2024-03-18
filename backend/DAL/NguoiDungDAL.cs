



using DAL.Helper;
using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NguoiDungDAL : INguoiDungDAL
    {
        private IDatabaseHelper _dbHelper;
        public NguoiDungDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public NguoiDungModel Login(string TaiKhoan, string MatKhau)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_login",
                     "@p_taikhoan", TaiKhoan,
                     "@p_matkhau", MatKhau);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NguoiDungModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public NguoiDungModel Check(string TaiKhoan, string Email)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_kiemtra",
                     "@p_taikhoan", TaiKhoan,
                     "@p_email", Email);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NguoiDungModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<NguoiDungModel> GetAll(int pageIndex, int pageSize, out int total, string Ten, int? IDQuyen)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_getall_desc",
                    "@p_pageindex", pageIndex,
                    "@p_pagesize", pageSize,
                    "@p_ten", Ten,
                    "@p_idQuyen", IDQuyen);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["TotalCount"];
                return dt.ConvertTo<NguoiDungModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public NguoiDungModel GetByID(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_getbyid", "@p_id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NguoiDungModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(NguoiDungModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_create",
                     "@p_taikhoan", model.TaiKhoan,
                     "@p_matkhau", model.MatKhau,
                     "@p_email", model.Email,
                     "@p_ten", model.Ten,
                     "@p_diachi", model.DiaChi,
                     "@p_sdt", model.SDT,
                     "@p_gioitinh", model.GioiTinh,
                     "@p_trangthai", model.TrangThai,
                     "@p_idquyen", model.IDQuyen,
                     "@p_token", model.Token);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Update(NguoiDungModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_update",
                    "@p_id", model.ID,
                    "@p_matkhau", model.MatKhau,
                    "@p_ten", model.Ten,
                    "@p_diachi", model.DiaChi,
                    "@p_sdt", model.SDT,
                    "@p_gioitinh", model.GioiTinh,
                    "@p_anh", model.Anh,
                    "@p_trangthai", model.TrangThai,
                    "@p_idquyen", model.IDQuyen);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Delete(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nguoidung_delete", "@p_id", id);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ConfirmEmail(string token)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_confirm", "@p_token", token);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
