export interface ThongKeDoanhThuTheoThang {
    thoiGian: string;
    doanhThuTheoThang: number;
}

export interface ThongKeDoanhThuSanPham {
    id: number;
    ten: string;
    anh: number;
    doanhThu: number;
}

export interface ThongKeDoanhThuLoaiSanPham {
    tenLoai: number;
    soLuong: number;
    doanhThu: number;
}

export interface ThongKeSoLuong {
    soLuongSanPham: number;
    soLuongNguoiDung: number;
    soLuongDonHang: number;
    doanhSo: number;
}