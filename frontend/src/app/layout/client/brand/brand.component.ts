import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { OwlOptions } from 'ngx-owl-carousel-o';

@Component({
  selector: 'app-brand',
  templateUrl: './brand.component.html',
  styleUrls: ['./brand.component.css']
})
export class BrandComponent {
  ListNhaSanXuat: NhaSanXuat[] = [];

  constructor(
    private nhaSanXuatService: NhaSanXuatService,
    private _router: Router
  ) {}

  ngOnInit() {
    this.getall();
  }

  //Tìm kiếm theo nhà sản xuất
  searchNhaSanXuat(idNhaSanXuat: number) {
    this._router.navigate(['/timkiem'], { queryParams: { 'idNhaSanXuat': idNhaSanXuat } });
  }

  //Lấy toàn bộ nhà sản xuất
  getall() {
    this.nhaSanXuatService.get().subscribe(res => {
      this.ListNhaSanXuat = res.data;
    });
  }

  brandSlide: OwlOptions = {
    loop: true,
    margin: 15,
    autoplay: true,
    autoplayHoverPause: true,
    autoplayTimeout: 5000,
    smartSpeed: 1000,
    dots: false,
    responsive: {
      994: {
        items: 5
      },
      768: {
        items: 4
      },
      575: {
        items: 3
      },
      479: {
        items: 2
      },
      0: {
        items: 2
      }
    }
  };
}
