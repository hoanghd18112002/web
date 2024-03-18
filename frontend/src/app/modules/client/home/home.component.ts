import { Component } from '@angular/core';
import { SanPham } from 'src/app/models/sanpham.model';
import { CartService } from 'src/app/service/cart.service';
import { SanPhamService } from 'src/app/service/sanpham.service';

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
    this.sanPhamService.getsanphammoi().subscribe(res => {
      this.ListSanPhamMoi = res.data;
    });
  }

  //Lấy toàn bộ sản phẩm bán chạy
  getsanphambanchay() {
    this.sanPhamService.getsanphambanchay().subscribe(res => {
      this.ListSanPhamBanChay = res.data;
    });
  }

  //Lấy toàn bộ sản phẩm giảm giá
  getsanphamgiamgia() {
    this.sanPhamService.getsanphamgiamgia().subscribe(res => {
      this.ListSanPhamGiamGia = res.data;
    });
  }
}
