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
    public class ThamSoDAL : IThamSoDAL
    {
        private IDatabaseHelper _dbHelper;
        public ThamSoDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public ThamSoModel GetByMa(string Ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thamso_getbyma", "@p_ma", Ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ThamSoModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ThamSoModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thamso_getall_desc",
                    "@p_pageindex", pageIndex,
                    "@p_pagesize", pageSize,
                    "@p_ten", Ten);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (int)dt.Rows[0]["TotalCount"];
                return dt.ConvertTo<ThamSoModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ThamSoModel GetByID(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thamso_getbyid", "@p_id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ThamSoModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(ThamSoModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thamso_create",
                     "@p_ma", model.Ma,
                     "@p_ten", model.Ten,
                     "@p_noidung", model.NoiDung,
                     "@p_anh", model.Anh,
                     "@p_trangthai", model.TrangThai);
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
        public bool Update(ThamSoModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_thamso_update",
                    "@p_id", model.ID,
                    "@p_ma", model.Ma,
                    "@p_ten", model.Ten,
                    "@p_noidung", model.NoiDung,
                    "@p_anh", model.Anh,
                    "@p_trangthai", model.TrangThai);
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_thamso_delete", "@p_id", id);
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
