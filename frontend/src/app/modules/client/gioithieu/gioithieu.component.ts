import { Component } from '@angular/core';
import { GioiThieu } from 'src/app/models/gioithieu.model';
import { ThamSo } from 'src/app/models/thamso.model';
import { GioiThieuService } from 'src/app/service/gioithieu.service';
import { ThamsoService } from 'src/app/service/thamso.service';

@Component({
  selector: 'app-gioithieu',
  templateUrl: './gioithieu.component.html',
  styleUrls: ['./gioithieu.component.css']
})
export class GioithieuComponent {
  ListGioiThieu: GioiThieu[] = [];

  free: ThamSo = new ThamSo();
  fast: ThamSo = new ThamSo();
  chat: ThamSo = new ThamSo();

  constructor(private gioiThieuService: GioiThieuService, private thamsoService: ThamsoService) {}

  ngOnInit(){
    this.getall();
    this.loadThamSo();
  }

  //Lấy toàn bộ giới thiệu
  getall() {
    this.gioiThieuService.get().subscribe(res => {
      this.ListGioiThieu = res.data;
    });
  }

  //Tham số
  loadThamSo() {
    this.thamsoService.getbyma("FREE").subscribe(res => {
      this.free = res.data;
    });
    this.thamsoService.getbyma("FAST").subscribe(res => {
      this.fast = res.data;
    });
    this.thamsoService.getbyma("CHAT").subscribe(res => {
      this.chat = res.data;
    });
  }  
}
