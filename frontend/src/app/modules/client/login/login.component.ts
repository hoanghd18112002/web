import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  TaiKhoan: string = '';
  MatKhau: string = '';
  
  ThongBao: string = '';
  
  constructor(private service: AuthService, private router: Router) {}

  ngOnInit(){}

  //Đăng nhập
  Login() {
    if (!this.TaiKhoan || !this.MatKhau) {
        swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Vui lòng nhập tài khoản và mật khẩu.'
        });
        return;
    }

    const nguoidung: any = {
        taiKhoan: this.TaiKhoan,
        matKhau: this.MatKhau,
    };
    this.service.login(nguoidung).subscribe(res => {
        if (!res.success) {
            swal.fire({
                icon: 'error',
                title: res.message,
                showConfirmButton: true,
                timer: 1500
              });(res.message);
            return;
        } else if(res.data.trangThai != 1) {
            swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Tài khoản của bạn đã bị khoá.'
            });
            return;
        } else if (res.success) {
            const user = {
                ...res.data,
                loginTime: new Date().getTime()
            };
            localStorage.setItem('user', JSON.stringify(user));
            if (res.data.idQuyen == 2) {
                this.router.navigate(['/']);
            } else if (res.data.idQuyen == 1 || res.data.idQuyen == 3){
                this.router.navigate(['/admin/']);
            } else if (res.data.idQuyen == 4){
                this.router.navigate(['/admin/doithongtin']);
            } 
            else{
                this.router.navigate(['/admin/']);
            }      
        } else {
            swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: res.message
            });
        }
    },);
  }
}
