import { Component } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';

@Component({
  selector: 'app-quydinhbaohanh',
  templateUrl: './quydinhbaohanh.component.html',
  styleUrls: ['./quydinhbaohanh.component.css']
})
export class QuydinhbaohanhComponent {
  ListDieuKhoan: DieuKhoan[] = [];

  constructor(private dieuKhoanService: DieuKhoanService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ điều khoản
  getall() {
    this.dieuKhoanService.getbykieu(3).subscribe(res => {
      this.ListDieuKhoan = res.data;
    });
  }
}
