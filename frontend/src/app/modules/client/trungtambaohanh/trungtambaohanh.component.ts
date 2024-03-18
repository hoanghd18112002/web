import { Component } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';

@Component({
  selector: 'app-trungtambaohanh',
  templateUrl: './trungtambaohanh.component.html',
  styleUrls: ['./trungtambaohanh.component.css']
})
export class TrungtambaohanhComponent {
  ListDieuKhoan: DieuKhoan[] = [];

  constructor(private dieuKhoanService: DieuKhoanService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ điều khoản
  getall() {
    this.dieuKhoanService.getbykieu(4).subscribe(res => {
      this.ListDieuKhoan = res.data;
    });
  }
}
