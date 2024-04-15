import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/service/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'front-end';

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.checkTokenExpiration();
  }

  checkTokenExpiration() {
    const user = this.authService.getCurrentUser();
    if (user && user.token) {
      if (!this.authService.isTokenValid()) {
        this.authService.logout();
      }
    }
  }
}
