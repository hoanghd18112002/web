import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { LayoutClientComponent } from './layout/template/layout-client/layout-client.component';
import { HomeComponent } from './modules/client/home/home.component';
import { LienheComponent } from './modules/client/lienhe/lienhe.component';
import { GioithieuComponent } from './modules/client/gioithieu/gioithieu.component';
import { DieukhoandichvuComponent } from './modules/client/dieukhoandichvu/dieukhoandichvu.component';
import { QuydinhdoitraComponent } from './modules/client/quydinhdoitra/quydinhdoitra.component';
import { QuydinhbaohanhComponent } from './modules/client/quydinhbaohanh/quydinhbaohanh.component';
import { TrungtambaohanhComponent } from './modules/client/trungtambaohanh/trungtambaohanh.component';
import { ChinhsachbaomatComponent } from './modules/client/chinhsachbaomat/chinhsachbaomat.component';
import { TintucComponent } from './modules/client/tintuc/tintuc.component';
import { CartComponent } from './modules/client/cart/cart.component';
import { ThanhtoanComponent } from './modules/client/thanhtoan/thanhtoan.component';
import { LoginComponent } from './modules/client/login/login.component';
import { SigninComponent } from './modules/client/signin/signin.component';
import { TaikhoanComponent } from './modules/client/taikhoan/taikhoan.component';
import { ChitietsanphamComponent } from './modules/client/chitietsanpham/chitietsanpham.component';
import { DanhmucsanphamComponent } from './modules/client/danhmucsanpham/danhmucsanpham.component';
import { ChitiettintucComponent } from './modules/client/chitiettintuc/chitiettintuc.component';
import { TimkiemComponent } from './modules/client/timkiem/timkiem.component';

import { ErrorComponent } from './modules/client/error/error.component';
import { AuthGuard } from './service/guard.service';

import { LayoutAdminComponent } from './layout/template/layout-admin/layout-admin.component';
import { MainComponent } from './modules/admin/main/main.component';
import { QlsanphamComponent } from './modules/admin/qlsanpham/qlsanpham.component';
import { QllienheComponent } from './modules/admin/qllienhe/qllienhe.component';
import { QlquyenComponent } from './modules/admin/qlquyen/qlquyen.component';
import { QlkhoComponent } from './modules/admin/qlkho/qlkho.component';
import { QlphuongthucComponent } from './modules/admin/qlphuongthuc/qlphuongthuc.component';
import { QldieukhoanComponent } from './modules/admin/qldieukhoan/qldieukhoan.component';
import { QlmenuComponent } from './modules/admin/qlmenu/qlmenu.component';
import { QlnhacungcapComponent } from './modules/admin/qlnhacungcap/qlnhacungcap.component';
import { QldonhangComponent } from './modules/admin/qldonhang/qldonhang.component';
import { QlgioithieuComponent } from './modules/admin/qlgioithieu/qlgioithieu.component';
import { QlslideComponent } from './modules/admin/qlslide/qlslide.component';
import { QlloaisanphamComponent } from './modules/admin/qlloaisanpham/qlloaisanpham.component';
import { QlnhasanxuatComponent } from './modules/admin/qlnhasanxuat/qlnhasanxuat.component';
import { QltintucComponent } from './modules/admin/qltintuc/qltintuc.component';
import { QlhoadonnhapComponent } from './modules/admin/qlhoadonnhap/qlhoadonnhap.component';
import { QlnguoidungComponent } from './modules/admin/qlnguoidung/qlnguoidung.component';
import { ProfileComponent } from './modules/admin/profile/profile.component';
import { QlgiamgiaComponent } from './modules/admin/qlgiamgia/qlgiamgia.component';
// import { ErroradminComponent } from './modules/admin/erroradmin/erroradmin.component';
import { NhapkhoComponent } from './modules/admin/nhapkho/nhapkho.component';
import { DoithongtinComponent } from './modules/admin/doithongtin/doithongtin.component';
import { ConfirmComponent } from './modules/client/confirm/confirm.component';
import { CamonComponent } from './modules/client/camon/camon.component';

const routes: Routes = [
  {
    path: 'admin', component: LayoutAdminComponent,
    canActivate: [AuthGuard],
    children:[
      {
        path: '',
        component: MainComponent,
        title: 'Bảng điều khiển - Cửa hàng điện máy'
      },
      {
        path: 'qlsanpham',
        component: QlsanphamComponent,
        title: 'Quản lý sản phẩm - Cửa hàng điện máy'
      },
      {
        path: 'qllienhe',
        component: QllienheComponent,
        title: 'Quản lý liên hê - Cửa hàng điện máy'
      },
      {
        path: 'qlquyen',
        component: QlquyenComponent,
        title: 'Quản lý quyền - Cửa hàng điện máy'
      },
      {
        path: 'qlkho',
        component: QlkhoComponent,
        title: 'Quản lý kho - Cửa hàng điện máy'
      },
      {
        path: 'qlphuongthuc',
        component: QlphuongthucComponent,
        title: 'Quản lý phương thức - Cửa hàng điện máy'
      },
      {
        path: 'qldieukhoan',
        component: QldieukhoanComponent,
        title: 'Quản lý điều khoản - Cửa hàng điện máy'
      },
      {
        path: 'qlmenu',
        component: QlmenuComponent,
        title: 'Quản lý menu - Cửa hàng điện máy'
      },
      {
        path: 'qlnhacungcap',
        component: QlnhacungcapComponent,
        title: 'Quản lý nhà cung cấp - Cửa hàng điện máy'
      },
      {
        path: 'qldonhang',
        component: QldonhangComponent,
        title: 'Quản lý đơn hàng - Cửa hàng điện máy'
      },
      {
        path: 'qlgioithieu',
        component: QlgioithieuComponent,
        title: 'Quản lý giới thiệu - Cửa hàng điện máy'
      },
      {
        path: 'qlslide',
        component: QlslideComponent,
        title: 'Quản lý slide - Cửa hàng điện máy'
      },
      {
        path: 'qlloaisanpham',
        component: QlloaisanphamComponent,
        title: 'Quản lý loại sản phẩm - Cửa hàng điện máy'
      },
      {
        path: 'qlnhasanxuat',
        component: QlnhasanxuatComponent,
        title: 'Quản lý nhà sản xuất - Cửa hàng điện máy'
      },
      {
        path: 'qltintuc',
        component: QltintucComponent,
        title: 'Quản lý tin tức - Cửa hàng điện máy'
      },
      {
        path: 'qlhoadonnhap',
        component: QlhoadonnhapComponent,
        title: 'Quản lý hoá đơn nhập - Cửa hàng điện máy'
      },
      {
        path: 'qlnguoidung',
        component: QlnguoidungComponent,
        title: 'Quản lý người dùng - Cửa hàng điện máy'
      },
      {
        path: 'profile',
        component: ProfileComponent,
        title: 'Trang cá nhân - Cửa hàng điện máy'
      },
      {
        path: 'qlgiamgia',
        component: QlgiamgiaComponent,
        title: 'Quản lý giảm giá - Cửa hàng điện máy'
      },
      {
        path: 'nhapkho',
        component: NhapkhoComponent,
        title: 'Nhập kho - Cửa hàng điện máy'
      },
      {
        path: 'doithongtin',
        component: DoithongtinComponent,
        title: 'Đổi thông tin - Cửa hàng điện máy'
      },
      // { 
      //   path: '**', 
      //   component: ErroradminComponent
      // }
    ]
  },
  {
    path: '', component: LayoutClientComponent,
    children:[
      {
        path: '',
        component: HomeComponent,
        title: 'Trang chủ - Cửa hàng điện máy'
      },
      {
        path: 'gioithieu',
        component: GioithieuComponent,
        title: 'Giới thiệu - Cửa hàng điện máy'
      },
      {
        path: 'tintuc',
        component: TintucComponent,
        title: 'Tin tức - Cửa hàng điện máy'
      },
      {
        path: 'lienhe',
        component: LienheComponent,
        title: 'Liên hệ - Cửa hàng điện máy'
      },
      {
        path: 'dieukhoandichvu',
        component: DieukhoandichvuComponent,
        title: 'Điều khoản dịch vụ - Cửa hàng điện máy'
      },
      {
        path: 'quydinhdoitra',
        component: QuydinhdoitraComponent,
        title: 'Quy định đổi trả - Cửa hàng điện máy'
      },
      {
        path: 'quydinhbaohanh',
        component: QuydinhbaohanhComponent,
        title: 'Quy định bảo hành - Cửa hàng điện máy'
      },
      {
        path: 'trungtambaohanh',
        component: TrungtambaohanhComponent,
        title: 'Trung tâm bảo hành - Cửa hàng điện máy'
      },
      {
        path: 'chinhsachbaomat',
        component: ChinhsachbaomatComponent,
        title: 'Chính sách bảo mật - Cửa hàng điện máy'
      },
      {
        path: 'cart',
        component: CartComponent,
        title: 'Giỏ hàng - Cửa hàng điện máy'
      },
      {
        path: 'thanhtoan',
        component: ThanhtoanComponent,
        canActivate: [AuthGuard],
        title: 'Thanh toán - Cửa hàng điện máy'
      },
      {
        path: 'login',
        component: LoginComponent,
        title: 'Đăng nhập - Cửa hàng điện máy'
      },
      {
        path: 'signin',
        component: SigninComponent,
        title: 'Đăng ký - Cửa hàng điện máy'
      },
      {
        path: 'taikhoan',
        component: TaikhoanComponent,
        canActivate: [AuthGuard],
        title: 'Tài khoản - Cửa hàng điện máy'
      },
      {
        path: 'chitietsanpham/:id',
        component: ChitietsanphamComponent,
        title: 'Chi tiết sản phẩm - Cửa hàng điện máy'
      },      
      {
        path: 'danhmucsanpham/:id',
        component: DanhmucsanphamComponent,
        title: 'Danh mục sản phẩm - Cửa hàng điện máy'
      },
      {
        path: 'chitiettintuc/:id',
        component: ChitiettintucComponent,
        title: 'Chi tiết tin tức - Cửa hàng điện máy'
      },
      {
        path: 'timkiem',
        component: TimkiemComponent,
        title: 'Tìm kiếm - Cửa hàng điện máy'
      },
      {
        path: 'confirm',
        component: ConfirmComponent,
        title: 'Xác nhận - Cửa hàng điện máy'
      },
      {
        path: 'camon',
        component: CamonComponent,
        title: 'Cảm ơn - Cửa hàng điện máy'
      },
    ]
  },
  { 
    path: '**', 
    component: ErrorComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
