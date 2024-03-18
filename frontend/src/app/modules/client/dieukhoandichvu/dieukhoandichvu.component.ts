import { Component } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';

@Component({
  selector: 'app-dieukhoandichvu',
  templateUrl: './dieukhoandichvu.component.html',
  styleUrls: ['./dieukhoandichvu.component.css']
})
export class DieukhoandichvuComponent {
  ListDieuKhoan: DieuKhoan[] = [];

  constructor(private dieuKhoanService: DieuKhoanService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ điều khoản
  getall() {
    this.dieuKhoanService.getbykieu(1).subscribe(res => {
      this.ListDieuKhoan = res.data;
    });
  }
}
