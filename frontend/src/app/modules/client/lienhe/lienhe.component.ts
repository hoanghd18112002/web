import { Component, OnInit } from '@angular/core';
import { LienHe } from 'src/app/models/lienhe.model';
import { LienHeService } from 'src/app/service/lienhe.service';

@Component({
  selector: 'app-lienhe',
  templateUrl: './lienhe.component.html',
  styleUrls: ['./lienhe.component.css']
})
export class LienheComponent implements OnInit {
  ListLienHe: LienHe[] = [];

  constructor(private lienHeService: LienHeService) {}

  ngOnInit(){
    this.getall();
  }

  //Lấy toàn bộ liên hệ
  getall() {
    this.lienHeService.get().subscribe(res => {
      this.ListLienHe = res.data;
    });
  }
}
