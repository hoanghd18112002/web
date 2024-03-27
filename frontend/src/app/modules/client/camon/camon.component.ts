import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { VnPayService } from 'src/app/service/vnpay.service';


@Component({
  selector: 'app-camon',
  templateUrl: './camon.component.html',
  styleUrls: ['./camon.component.css']
})
export class CamonComponent {
  success: string = "Thanh toán không thành công";
  text: string = "Vui lòng kiểm tra lại";

  constructor(
    private vnPayService: VnPayService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.router.navigate([], { queryParams: {} });
      console.log(params);
      this.callback(params);
    });
  }

  callback(params: any) {
    this.vnPayService.callback(params).subscribe(res => {
      if(res.success){
        this.success = "Thanh toán thành công cho đơn hàng " + res.orderId;
        this.text = "Cảm ơn bạn đã sử dụng dịch vụ";
      }
    })
  }
}
