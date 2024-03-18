import { Component } from '@angular/core';
import { GioiThieu } from 'src/app/models/gioithieu.model';
import { GioiThieuService } from 'src/app/service/gioithieu.service';

@Component({
  selector: 'app-gioithieu',
  templateUrl: './gioithieu.component.html',
  styleUrls: ['./gioithieu.component.css']
})
export class GioithieuComponent {
  ListGioiThieu: GioiThieu[] = [];

  constructor(private gioiThieuService: GioiThieuService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ giới thiệu
  getall() {
    this.gioiThieuService.get().subscribe(res => {
      this.ListGioiThieu = res.data;
    });
  }
}
