import { Component } from '@angular/core';
import { CartService } from 'src/app/service/cart.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent {
  ListGioHang: any[] = [];
  SoLuong: number = 0;
  TongGia: number = 0;

  constructor(private service: CartService) {}

  ngOnInit(){
    this.loadGioHang();

    this.service.cartUpdated.subscribe(() => {
      this.loadGioHang();
    });
  }

  //Tăng
  tangGioHang(id: number) {
    this.service.tangGioHang(id);
  }

  //Giảm
  giamGioHang(id: number) {
    this.service.giamGioHang(id);
  }

  //Xoá
  deleteGioHang(id: number) {
    this.service.deleteGioHang(id);
  }

  //Xoá toàn bộ
  deleteAllGioHang() {
    this.service.deleteAllGioHang();
  }

  //Load giỏ hàng
  loadGioHang() {
    var cart = this.service.loadGioHang();
    this.ListGioHang = cart.cart;
    this.SoLuong = cart.SoLuong;
    this.TongGia = cart.TongGia;
  } 

  //Thanh toán
  thanhToan() {
    const user = localStorage.getItem('user');
    if (!user) {
        // Thông báo khi người dùng chưa đăng nhập
        swal.fire({
            icon: 'error',
            title: 'Bạn chưa đăng nhập',
            text: 'Vui lòng đăng nhập để thanh toán.'
        });
        return;
    }

    const cart = localStorage.getItem('cart');
    if (!cart || JSON.parse(cart).length === 0) {
        // Thông báo khi giỏ hàng trống
        swal.fire({
            icon: 'warning',
            title: 'Giỏ hàng của bạn đang trống',
            text: 'Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.'
        });
        return;
    }

    location.assign('/thanhtoan');
  }
}
