﻿using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IHoaDonNhapDAL
    {
        List<HoaDonNhapModel> GetAll(int pageIndex, int pageSize, out int total);
        HoaDonNhapModel GetNew();
        HoaDonNhapModel GetByID(int id);
        bool Create(HoaDonNhapModel model);
        bool Update(HoaDonNhapModel model);
        bool Delete(int id);
    }
}