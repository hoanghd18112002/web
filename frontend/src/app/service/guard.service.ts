import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from './auth.service';

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
        } 
        else if (user.idQuyen === 2) {
          // Quyền là 2, kiểm tra trang cụ thể
          if (state.url === '/taikhoan' || state.url === '/thanhtoan') {
            return true;
          } else {
            this.router.navigate(['/login']);
            return false;
          }
        } 
        else {
          // Quyền là 3, kiểm tra trang cụ thể
          if (state.url === '/admin/qlnguoidung') {
            this.router.navigate(['/login']);
            return false;
          } else {
            return true;
          }
        }        
      }
    }
    this.router.navigate(['/login']);
    return false;
  }
}