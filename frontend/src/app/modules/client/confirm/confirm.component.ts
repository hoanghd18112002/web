import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { NgForm } from '@angular/forms';
import { NguoiDungService } from 'src/app/service/nguoidung.service';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.css']
})
export class ConfirmComponent implements OnInit {
  emailConfirmationToken: string = "";
  confirmationError: string = "";
  confirmationSuccess: boolean = false;

  constructor(private route: ActivatedRoute, private nguoiDungService: NguoiDungService) { }

  ngOnInit(): void {
    // Lấy thông tin về token xác nhận email từ URL
    this.route.queryParams.subscribe(params => {
      this.emailConfirmationToken = params['token'];
      if (this.emailConfirmationToken) {
        // Gọi phương thức xác nhận email khi component được khởi tạo
        this.confirmEmail();
      }
    });
  }

  confirmEmail() {
    const obj = {
      token: this.emailConfirmationToken
    }
    // Gửi yêu cầu xác nhận email với token đến backend
    this.nguoiDungService.confirmemail(obj).subscribe(
      (res) => {
        // Xác nhận thành công
        this.confirmationSuccess = true;
      },
      (error) => {
        // Xác nhận thất bại
        this.confirmationError = error;
      }
    );
  }
}
