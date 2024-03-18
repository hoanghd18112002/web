import { Component } from '@angular/core';
import { AuthService } from 'src/app/service/auth.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent {
  user: any;

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.loadUser()
  }

  //Load người dùng
  loadUser() {
    this.user = this.authService.loadUser();
  }  
}
