import { Component } from '@angular/core';
import { ThamSo } from 'src/app/models/thamso.model';
import { AuthService } from 'src/app/service/auth.service';
import { ThamsoService } from 'src/app/service/thamso.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent {
  logo: ThamSo = new ThamSo();

  user: any;
  
  constructor(
    private service: AuthService,
    private thamsoService: ThamsoService
  ) {}

  ngOnInit() {
    this.loadUser();
    this.loadThamSo()
  }

  //Load người dùng
  loadUser() {
    this.user = this.service.loadUser();
  } 

  //Tham số
  loadThamSo() {
    this.thamsoService.getbyma("LOGO").subscribe(res => {
      this.logo = res.data;
    });
  } 
  
  //Đăng xuất
  deleteUser() {
    this.service.logout();
  }   
}