import { Component } from '@angular/core';
import { SanPham } from 'src/app/models/sanpham.model';
import { CartService } from 'src/app/service/cart.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { OwlOptions } from 'ngx-owl-carousel-o';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  ListSanPhamMoi: SanPham[] = [];
  ListSanPhamBanChay: SanPham[] = [];
  ListSanPhamGiamGia: SanPham[] = [];

  constructor(
    private sanPhamService: SanPhamService,
    private cartService: CartService
  ) {}

  ngOnInit(){
    this.getsanphammoi();
    this.getsanphambanchay();
    this.getsanphamgiamgia();
  }

  //Thêm vào giỏ hàng
  addToCart(id: number) {
    this.cartService.addToCart(id, 1);
  }

  //Lấy toàn bộ sản phẩm mới
  getsanphammoi() {
    this.sanPhamService.getsanphammoi(10).subscribe(res => {
      this.ListSanPhamMoi = res.data;
    });
  }

  //Lấy toàn bộ sản phẩm bán chạy
  getsanphambanchay() {
    this.sanPhamService.getsanphambanchay(10).subscribe(res => {
      this.ListSanPhamBanChay = res.data;
    });
  }

  //Lấy toàn bộ sản phẩm giảm giá
  getsanphamgiamgia() {
    this.sanPhamService.getsanphamgiamgia(10).subscribe(res => {
      this.ListSanPhamGiamGia = res.data;
    });
  }

  sanPhamSlide: OwlOptions = {
    loop: true,
    margin: 15,
    autoplay: true,
    autoplayHoverPause: true,
    autoplayTimeout: 3000,
    smartSpeed: 1000,
    dots: false,
    responsive: {
      994: { items: 5 },
      768: { items: 4 },
      575: { items: 3 },
      479: { items: 2 },
      0: { items: 2 }
    }
  };
}
