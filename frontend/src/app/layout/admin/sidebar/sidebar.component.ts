import { Component } from '@angular/core';
import { AuthService } from 'src/app/service/auth.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent {
  user: any;

  constructor(
    private service: AuthService
  ) {}

  ngOnInit() {
    this.loadUser()
  }

  //Load người dùng
  loadUser() {
    this.user = this.service.loadUser();
  } 
}