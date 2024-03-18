﻿using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class GioiThieuBLL : IGioiThieuBLL
    {
        private IGioiThieuDAL _res;
        public GioiThieuBLL(IGioiThieuDAL res)
        {
            _res = res;
        }
        public List<GioiThieuModel> Get()
        {
            return _res.Get();
        }
        public List<GioiThieuModel> GetAll(int pageIndex, int pageSize, out int total, string NoiDung)
        {
            return _res.GetAll(pageIndex, pageSize, out total, NoiDung);
        }
        public GioiThieuModel GetByID(int id)
        {
            return _res.GetByID(id);
        }
        public bool Create(GioiThieuModel model)
        {
            return _res.Create(model);
        }
        public bool Update(GioiThieuModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(int id)
        {
            return _res.Delete(id);
        }
    }
}