﻿
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IThongKeDAL
    {
        List<DoanhThuTheoThangModel> DoanhThuTheoThang(int sl);
        List<DoanhThuTheoNamModel> DoanhThuTheoNam(int nam);
        List<DoanhThuTheoQuyModel> DoanhThuTheoQuy(int nam);
        List<DoanhThuSanPhamModel> DoanhThuSanPham(int sl);
        List<LoaiSanPhamBanChayModel> LoaiSanPhamBanChay(int sl);
        List<SoLuongModel> SoLuong();
    }
}
