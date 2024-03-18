import { Component } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';

@Component({
  selector: 'app-chinhsachbaomat',
  templateUrl: './chinhsachbaomat.component.html',
  styleUrls: ['./chinhsachbaomat.component.css']
})
export class ChinhsachbaomatComponent {
  ListDieuKhoan: DieuKhoan[] = [];

  constructor(private dieuKhoanService: DieuKhoanService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ điều khoản
  getall() {
    this.dieuKhoanService.getbykieu(5).subscribe(res => {
      this.ListDieuKhoan = res.data;
    });
  }
}
