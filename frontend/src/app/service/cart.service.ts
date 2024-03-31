import { Injectable } from '@angular/core';
import { SanPhamService } from './sanpham.service';
import { Observable, map, Subject } from 'rxjs';
import swal from 'sweetalert2';

@Injectable({
  providedIn: 'root',
})
export class CartService {
    cartUpdated = new Subject<void>();

    constructor(
        private sanPhamService: SanPhamService,
    ) {}

    addToCart(id: number, soluong: number) {
        this.sanPhamService.getbyid(id).subscribe(res => {

            if (soluong > res.data.soLuong) {
                swal.fire({
                    icon: 'error',
                    title: 'Sản phẩm đã hết hàng',
                    text: 'Mời bạn mua sản phẩm khác',
                });
            } else {
                const sanpham = {
                    id: res.data.id,
                    ten: res.data.ten,
                    anh: res.data.anh,
                    soluong: soluong,
                    gia: res.data.gia,
                };
    
                // Kiểm tra có giảm giá không
                if (res.data.phanTram != null) {
                    sanpham.gia = res.data.giaGiamGia;
                }
            
                let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
                
                const check = cart.find((item: any) => item.id === sanpham.id);
            
                // Đã tồn tại thì + soluong, chưa thì thêm mới
                if (check) {
                    check.soluong += soluong;
                } else {
                    cart.push({ ...sanpham });
                }
            
                localStorage.setItem('cart', JSON.stringify(cart));
    
                swal.fire({
                    icon: 'success',
                    title: 'Đã thêm vào giỏ hàng!',
                    showConfirmButton: true,
                    timer: 1500
                });
    
                this.cartUpdated.next();
            }
        });
    }    

    // Load giỏ hàng header
    loadGioHang() {
        let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
        var SoLuong = cart.reduce((total, item) => total + item.soluong, 0);
        var TongGia = cart.reduce((total, item) => total + (item.gia * item.soluong), 0);

        return { cart: cart, SoLuong: SoLuong, TongGia: TongGia };
    }

    // Tăng số lượng sản phẩm trong giỏ hàng
    tangGioHang(id: number) {
        let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
        const item = cart.find(item => item.id === id);

        if (item) {
            item.soluong += 1;
            localStorage.setItem('cart', JSON.stringify(cart));
            this.cartUpdated.next();
        }
    }

    // Giảm số lượng sản phẩm trong giỏ hàng
    giamGioHang(id: number) {
        let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
        const item = cart.find(item => item.id === id);
    
        if (item) {
            item.soluong -= 1;

            if (item.soluong <= 0) {
                cart = cart.filter(cartItem => cartItem.id !== id);
            }
        
            localStorage.setItem('cart', JSON.stringify(cart));
            this.cartUpdated.next();
        }
    }  

    // Xóa sản phẩm khỏi giỏ hàng
    deleteGioHang(id: number) {
        swal.fire({
            icon: 'question',
            title: 'Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng không?',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
                cart = cart.filter(item => item.id !== id);

                localStorage.setItem('cart', JSON.stringify(cart));
                this.cartUpdated.next();
            }
        });
    }

    // Xoá toàn bộ sản phẩm
    deleteAllGioHang() {
        swal.fire({
            icon: 'question',
            title: 'Bạn có chắc chắn muốn xóa toàn bộ sản phẩm khỏi giỏ hàng không?',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                localStorage.removeItem('cart');
                this.cartUpdated.next();
            }
        });
    }
}