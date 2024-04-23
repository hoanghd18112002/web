import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgxPaginationModule } from 'ngx-pagination';
import { AngularEditorModule } from '@kolkov/angular-editor';
import { NgSelectModule } from '@ng-select/ng-select';
import { CarouselModule } from 'ngx-owl-carousel-o';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { LayoutClientComponent } from './layout/template/layout-client/layout-client.component';
import { HomeComponent } from './modules/client/home/home.component';
import { HeaderComponent } from './layout/client/header/header.component';
import { FooterComponent } from './layout/client/footer/footer.component';
import { SlideComponent } from './layout/client/slide/slide.component';
import { ScrollComponent } from './layout/client/scroll/scroll.component';
import { BrandComponent } from './layout/client/brand/brand.component';
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

import { LayoutAdminComponent } from './layout/template/layout-admin/layout-admin.component';
import { AdHeaderComponent } from './layout/admin/ad-header/ad-header.component';
import { AdFooterComponent } from './layout/admin/ad-footer/ad-footer.component';
import { SettingsidebarComponent } from './layout/admin/settingsidebar/settingsidebar.component';
import { SidebarComponent } from './layout/admin/sidebar/sidebar.component';
import { MainComponent } from './modules/admin/main/main.component';
import { QlsanphamComponent } from './modules/admin/qlsanpham/qlsanpham.component';
import { QllienheComponent } from './modules/admin/qllienhe/qllienhe.component';
import { QlquyenComponent } from './modules/admin/qlquyen/qlquyen.component';
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
import { DoithongtinComponent } from './modules/admin/doithongtin/doithongtin.component';
import { ErroradminComponent } from './modules/admin/erroradmin/erroradmin.component';
import { ConfirmComponent } from './modules/client/confirm/confirm.component';
import { CamonComponent } from './modules/client/camon/camon.component';
import { NhapsoluongComponent } from './modules/admin/nhapsoluong/nhapsoluong.component';
import { QlthamsoComponent } from './modules/admin/qlthamso/qlthamso.component';
import { TracuudonhangComponent } from './modules/client/tracuudonhang/tracuudonhang.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LayoutClientComponent,
    HeaderComponent,
    FooterComponent,
    SlideComponent,
    ScrollComponent,
    BrandComponent,
    LienheComponent,
    GioithieuComponent,
    DieukhoandichvuComponent,
    QuydinhdoitraComponent,
    QuydinhbaohanhComponent,
    TrungtambaohanhComponent,
    ChinhsachbaomatComponent,
    TintucComponent,
    CartComponent,
    ThanhtoanComponent,
    LoginComponent,
    SigninComponent,
    TaikhoanComponent,
    ChitietsanphamComponent,
    DanhmucsanphamComponent,
    ChitiettintucComponent,
    TimkiemComponent,
    LayoutAdminComponent,
    AdHeaderComponent,
    AdFooterComponent,
    SettingsidebarComponent,
    SidebarComponent,
    MainComponent,
    QlsanphamComponent,
    QllienheComponent,
    QlquyenComponent,
    QlphuongthucComponent,
    QldieukhoanComponent,
    QlmenuComponent,
    QlnhacungcapComponent,
    QldonhangComponent,
    QlgioithieuComponent,
    QlslideComponent,
    QlloaisanphamComponent,
    QlnhasanxuatComponent,
    QltintucComponent,
    QlhoadonnhapComponent,
    QlnguoidungComponent,
    ProfileComponent,
    QlgiamgiaComponent,
    ErrorComponent,
    ErroradminComponent,
    DoithongtinComponent,
    ConfirmComponent,
    CamonComponent,
    NhapsoluongComponent,
    QlthamsoComponent,
    TracuudonhangComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    NgxPaginationModule,
    ReactiveFormsModule,
    AngularEditorModule,
    NgSelectModule,
    CarouselModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
