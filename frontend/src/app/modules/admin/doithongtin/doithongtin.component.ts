import { Component } from '@angular/core';
import { AuthService } from 'src/app/service/auth.service';
import { NguoiDungService } from 'src/app/service/nguoidung.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-doithongtin',
  templateUrl: './doithongtin.component.html',
  styleUrls: ['./doithongtin.component.css']
})
export class DoithongtinComponent {
  user: any;

  ID: number = 0;
  Email: string = '';
  TaiKhoan: string = '';
  Ten: string = '';
  DiaChi: string = '';
  SDT: string = '';
  NgayTao: string = '';
  GioiTinh: any;
  TenQuyen: string = '';
  Anh: any = null;

  MatKhauCu: string = '';
  MatKhauMoi: string = '';
  NhapLaiMatKhauMoi: string = '';

  constructor(
    private authService: AuthService, 
    private nguoiDungService: NguoiDungService
  ) {}

  ngOnInit(){
    this.loadUser();
  }

  //Sửa thông tin người dùng
  edit() {
    if (!this.DiaChi || !this.Ten || !this.SDT) {
        // Thông báo khi thông tin không đầy đủ
        swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Vui lòng điền đầy đủ thông tin có dấu đỏ.'
        });
        return;
    }

    const formData = new FormData();

    formData.append('id', this.user.id);
    formData.append('diaChi', this.DiaChi);
    formData.append('ten', this.Ten);
    formData.append('sdt', this.SDT);
    formData.append('gioiTinh', this.GioiTinh);

    if (this.Anh && this.Anh.size > 0) {
      formData.append('file', this.Anh);
    }

    if (this.MatKhauCu) {
      const check: any = {
          taiKhoan: this.user.taiKhoan,
          matKhau: this.MatKhauCu,
      }
      this.authService.login(check).subscribe(res => {
          if (res.success === false) {
              // Thông báo khi mật khẩu không chính xác
              swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Mật khẩu không chính xác.'
              });
          } else {
              //Kiểm tra có nhập mật khẩu mới không
              if (this.MatKhauMoi && this.NhapLaiMatKhauMoi) {
                  //Kiểm tra nhật khẩu mới có trùng không
                  if (this.MatKhauMoi === this.NhapLaiMatKhauMoi) {
                      //Đổi mật khẩu
                      formData.append('matKhau', this.MatKhauMoi);
                      this.nguoiDungService.update(formData).subscribe(res => { });
                      this.out();
                  } else {
                      // Thông báo khi mật khẩu mới không trùng khớp
                      swal.fire({
                          icon: 'error',
                          title: 'Lỗi',
                          text: 'Mật khẩu mới không trùng khớp.'
                      });
                  }
              }
              //Thay đổi thông tin
              else {
                  this.nguoiDungService.update(formData).subscribe(res => { });
                  this.out();
              }
          }
        });
    } else {
        // Thông báo khi chưa nhập mật khẩu để sửa thông tin
        swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Vui lòng nhập mật khẩu để sửa thông tin.'
        });
    }
  }

  out() {
    swal.fire({
        icon: 'success',
        title: 'Thành công',
        text: 'Thay đổi thông tin thành công, website sẽ tự động đăng xuất.',
        showConfirmButton: false
    });
    setTimeout(() => {
        this.authService.logout();
        location.reload();
    }, 3000); 
  }
  
  //Load người dùng
  loadUser() {
    this.user = this.user = this.authService.loadUser();
    
    if (this.user) {

      this.ID = this.user.id;
      this.Email = this.user.email;
      this.TaiKhoan = this.user.taiKhoan;
      this.Anh = this.user.anh;
      this.Ten = this.user.ten;
      this.DiaChi = this.user.diaChi;
      this.SDT = this.user.sdt;
      this.NgayTao = this.formatDate(this.user.ngayTao);
      this.GioiTinh = this.user.gioiTinh;
      this.TenQuyen = this.user.tenQuyen;
    }
  } 

  formatDate(date: string): string {
    const originalDate = new Date(date);
    originalDate.setDate(originalDate.getDate() + 1);
    const formattedDate = originalDate.toISOString().slice(0, 10);
    return formattedDate;
  }

  //File
  onFileChange(event: any) {
    const fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.Anh = fileList[0];
    }
  }
}
