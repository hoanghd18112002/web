import { Component, OnInit } from '@angular/core';
import { TinTuc } from 'src/app/models/tintuc.model';
import { TinTucService } from 'src/app/service/tintuc.service';

@Component({
  selector: 'app-tintuc',
  templateUrl: './tintuc.component.html',
  styleUrls: ['./tintuc.component.css']
})
export class TintucComponent implements OnInit {
  ListTinTuc: TinTuc[] = [];
  
  p: number = 1;
  pageSize: number = 6;
  totalItems: number = 0;

  constructor(private tinTucService: TinTucService) {}

  ngOnInit(){
    this.getTinTuc(this.p);
  }

  // Lấy toàn bộ tin tức
  getTinTuc(p: number) {
    const obj = {
      page: p,
      pageSize: this.pageSize
    };
    this.tinTucService.get(obj).subscribe(res => {
      this.ListTinTuc = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
  }
}
