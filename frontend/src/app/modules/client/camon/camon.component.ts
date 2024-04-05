import { Component, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { VnPayService } from 'src/app/service/vnpay.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-camon',
  templateUrl: './camon.component.html',
  styleUrls: ['./camon.component.css']
})
export class CamonComponent implements OnDestroy {
  success: string = "Thanh toán không thành công";
  text: string = "Vui lòng kiểm tra lại";
  private routeSubscription: Subscription;

  constructor(
    private vnPayService: VnPayService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.routeSubscription = this.route.queryParams.subscribe(params => {
      if (params && Object.keys(params).length > 0) {
        this.router.navigate([], { queryParams: {} });
        this.callback(params);
      }
    });
  }

  ngOnDestroy() {
    if (this.routeSubscription) {
      this.routeSubscription.unsubscribe();
    }
  }

  callback(params: any) {
    this.vnPayService.callback(params).subscribe(res => {
      if(res.success){
        this.success = "Thanh toán thành công cho đơn hàng " + res.orderId;
        this.text = "Cảm ơn bạn đã sử dụng dịch vụ";
      }
    });
  }
}
