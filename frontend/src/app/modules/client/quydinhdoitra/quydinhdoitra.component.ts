import { Component } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';

@Component({
  selector: 'app-quydinhdoitra',
  templateUrl: './quydinhdoitra.component.html',
  styleUrls: ['./quydinhdoitra.component.css']
})
export class QuydinhdoitraComponent {
  ListDieuKhoan: DieuKhoan[] = [];

  constructor(private dieuKhoanService: DieuKhoanService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ điều khoản
  getall() {
    this.dieuKhoanService.getbykieu(2).subscribe(res => {
      this.ListDieuKhoan = res.data;
    });
  }
}
