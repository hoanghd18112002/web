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
    public class SanPhamBLL : ISanPhamBLL
    {
        private ISanPhamDAL _res;
        public SanPhamBLL(ISanPhamDAL res)
        {
            _res = res;
        }
        public List<SanPhamModel> GetSanPhamMoi(int sl)
        {
            return _res.GetSanPhamMoi(sl);
        }
        public List<SanPhamModel> GetSanPhamBanChay(int sl)
        {
            return _res.GetSanPhamBanChay(sl);
        }
        public List<SanPhamModel> GetSanPhamGiamGia(int sl)
        {
            return _res.GetSanPhamGiamGia(sl);
        }
        public List<SanPhamModel> GetAll(int pageIndex, int pageSize, out int total, string Ten)
        {
            return _res.GetAll(pageIndex, pageSize, out total, Ten);
        }
        public List<SanPhamModel> GetRandom(int sl)
        {
            return _res.GetRandom(sl);
        }
        public List<SanPhamModel> Search(int pageIndex, int pageSize, out int total, int? id, string ten, string tennhasanxuat, string tenloai, int? mingia, int? maxgia, int? idnhasanxuat, int? idloai)
        {
            return _res.Search(pageIndex, pageSize, out total, id, ten, tennhasanxuat, tenloai, mingia, maxgia, idnhasanxuat, idloai);
        }
        public SanPhamModel GetNew()
        {
            return _res.GetNew();
        }
        public SanPhamModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(SanPhamModel model)
        {
            return _res.Create(model);
        }
        public bool Update(SanPhamModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}
