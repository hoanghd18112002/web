import { Component } from '@angular/core';
import { AuthService } from 'src/app/service/auth.service';

@Component({
  selector: 'app-ad-header',
  templateUrl: './ad-header.component.html',
  styleUrls: ['./ad-header.component.css']
})
export class AdHeaderComponent {
  user: any;

  constructor(private service: AuthService) {}

  ngOnInit() {
    this.loadUser()
  }

  //Load người dùng
  loadUser() {
    this.user = this.service.loadUser();
  }  

  //Đăng xuất
  deleteUser() {
    this.service.logout();
  }    
}
