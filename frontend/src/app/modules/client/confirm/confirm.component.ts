import { Component, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NguoiDungService } from 'src/app/service/nguoidung.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.css']
})
export class ConfirmComponent implements OnDestroy {
  success: string = "Xác nhận email thất bại";
  text: string = "Vui lòng kiểm tra lại";
  text1: string = "Có lỗi xảy ra";

  private routeSubscription: Subscription;

  constructor(
    private route: ActivatedRoute, 
    private nguoiDungService: NguoiDungService,
    private router: Router
  ) { 
    this.routeSubscription = this.route.queryParams.subscribe(params => {
      if (params && Object.keys(params).length > 0) {
        this.router.navigate([], { queryParams: {} });
        this.confirmEmail(params['token']);
      }
    });
  }

  ngOnDestroy() {
    if (this.routeSubscription) {
      this.routeSubscription.unsubscribe();
    }
  }

  confirmEmail(token: string) {
    this.nguoiDungService.confirmemail({ token }).subscribe(res => {
      if(res.success){
        this.success = "Xác nhận email thành công";
        this.text = "Cảm ơn bạn đã xác nhận email thành công.";
        this.text1 = "Bạn có thể đăng nhập vào tài khoản của mình bây giờ.";
      }
    });
  }
}
