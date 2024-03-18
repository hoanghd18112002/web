import { Component } from '@angular/core';
import { NguoiDungService } from 'src/app/service/nguoidung.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent {
  TaiKhoan: string = '';
  MatKhau: string = '';
  Ten: string = '';
  SDT: string = '';
  Email: string = '';
  DiaChi: string = '';
  NhapLaiMatKhau: string = '';

  ThongBao: string = '';
  isTermsChecked: boolean = false;

  constructor(private nguoiDungService: NguoiDungService) {}

  ngOnInit(){}

  //Đăng ký
  Signin() {
    // Kiểm tra điều kiện nhập đầy đủ thông tin
    if (!this.TaiKhoan || !this.MatKhau || !this.Ten || !this.SDT || !this.Email || !this.DiaChi) {
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Vui lòng nhập đầy đủ thông tin'
      });
      return;
    } else if (this.MatKhau !== this.NhapLaiMatKhau) {
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Nhập mật khẩu không khớp'
      });
      return;
    } else if (!this.isTermsChecked) {
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Vui lòng đọc và đồng ý với các điều khoản của website.'
      });
      return;
    } else if (!this.isValidEmail(this.Email)) {
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Email không đúng định dạng'
      });
      return;
    } else if (!this.isValidPhoneNumber(this.SDT)) {
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Số điện thoại phải là 10 số'
      });
      return;
    }

    const check: any = {
      taiKhoan: this.TaiKhoan,
      email: this.Email
    }
    // Tạo đối tượng nguoidung
    const nguoidung: any = {
      taiKhoan: this.TaiKhoan,
      matKhau: this.MatKhau,
      ten: this.Ten,
      sdt: this.SDT,
      email: this.Email,
      diaChi: this.DiaChi,
      gioiTinh: "1",
      trangThai: "1",
      idQuyen: "2",
      confirmationLink: `${window.location.origin}/confirm`
    };
    this.nguoiDungService.kiemtra(check).subscribe(res => {
      if (res.success === true) {
        this.nguoiDungService.create(nguoidung).subscribe(res => {
          if (res.success) {
            swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: res.message
            }).then(() => {
                location.assign('/login');
            });
          }
        });
      } else {
        // Hiển thị thông báo lỗi khi tài khoản hoặc email đã tồn tại
        swal.fire({
          icon: 'error',
          title: 'Lỗi',
          text: res.message
        });
      }
    });
  }
  
  // Kiểm tra email đúng định dạng
  isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
  
  // Kiểm tra số điện thoại là 10 số
  isValidPhoneNumber(phoneNumber: string): boolean {
    const phoneRegex = /^\d{10}$/;
    return phoneRegex.test(phoneNumber);
  }  

  //Đồng ý với các điều khoản
  onTermsChange(event: any) {
    this.isTermsChecked = event.target.checked;
  }
}
