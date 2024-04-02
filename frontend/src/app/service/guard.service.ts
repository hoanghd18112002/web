import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from './auth.service';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    if (this.authService.isAuthenticated()) {
      const user = this.authService.getCurrentUser();
      if (user) {
        if (user.idQuyen === 1) {
          // Quyền là 1, cho phép truy cập tất cả các trang
          return true;
        } else if (user.idQuyen === 2) {
          // Quyền là 2, kiểm tra trang cụ thể
          if (state.url === '/taikhoan' || state.url === '/thanhtoan') {
            return true;
          } else {
            this.showAccessDeniedAlert();
            this.router.navigate(['/login']);
            return false;
          }
        } else if (user.idQuyen === 3) {
          // Quyền là 3, kiểm tra trang cụ thể
          if (state.url === '/admin/qlnguoidung' || state.url === '/admin/qlquyen' || state.url === '/admin/qltintuc') {
            this.showAccessDeniedAlert();
            this.router.navigate(['/login']);
            return false;
          } else {
            return true;
          }
        } else if (user.idQuyen === 4) {
          // Quyền là 4, kiểm tra trang cụ thể
          if (state.url === '/admin/qltintuc' || state.url === '/admin/profile' || state.url === '/admin/profile' || state.url === '/admin/doithongtin' || state.url === '/taikhoan' || state.url === '/thanhtoan') {
            return true;
          } else {
            this.showAccessDeniedAlert();
            this.router.navigate(['/login']);
            return false;
          }
        }
      }
    }
    this.router.navigate(['/login']);
    return false;
  }

  private showAccessDeniedAlert(): void {
    Swal.fire({
      icon: 'error',
      title: 'Truy cập bị từ chối!',
      text: 'Bạn không đủ quyền truy cập vào trang này.',
      confirmButtonText: 'Đóng'
    });
  }
}