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
  totalPages: number = 0;
  totalPagesArray: number[] = [];
  visiblePages: number[] = [];

  constructor(private tinTucService: TinTucService) {}

  ngOnInit(){
    this.getTinTuc();
  }

  // Lấy toàn bộ tin tức
  getTinTuc() {
    const obj = {
      page: this.p,
      pageSize: this.pageSize
    };
    this.tinTucService.get(obj).subscribe(res => {
      this.ListTinTuc = res.data;
      this.totalItems = res.totalItems;
      this.calculateTotalPages();
    });
  }

  calculateTotalPages(): void {
    this.totalPages = Math.ceil(this.totalItems / this.pageSize);
  
    // Tính toán các trang được hiển thị
    if (this.totalPages <= 3) {
      this.visiblePages = Array.from({ length: this.totalPages }, (_, i) => i + 1);
    } else {
      if (this.p === 1) {
        this.visiblePages = [1, 2, 3];
      } else if (this.p === this.totalPages) {
        this.visiblePages = [this.totalPages - 2, this.totalPages - 1, this.totalPages];
      } else {
        this.visiblePages = [this.p - 1, this.p, this.p + 1];
      }
    }
  }

  pageChanged(page: number): void {
    this.p = page;
    this.calculateTotalPages();
    this.getTinTuc();
  }
}
