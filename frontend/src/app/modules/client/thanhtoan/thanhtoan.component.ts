import { Component, OnInit } from '@angular/core';
import { PhuongThuc } from 'src/app/models/phuongthuc.model';
import { DonHangService } from 'src/app/service/donhang.service';
import { PhuongThucService } from 'src/app/service/phuongthuc.service';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';
import { VnPayService } from 'src/app/service/vnpay.service';
import { PaymentInformation } from 'src/app/models/vnpayment.model';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { Router } from '@angular/router';
import { ThamsoService } from 'src/app/service/thamso.service';
import { ThamSo } from 'src/app/models/thamso.model';
import { forkJoin } from 'rxjs';
import { CartService } from 'src/app/service/cart.service';

@Component({
  selector: 'app-thanhtoan',
  templateUrl: './thanhtoan.component.html',
  styleUrls: ['./thanhtoan.component.css']
})
export class ThanhtoanComponent implements OnInit {
  ListPhuongThuc: PhuongThuc[] = [];

  thongthuong: ThamSo = new ThamSo();
  tietkiem: ThamSo = new ThamSo();
  nhanh: ThamSo = new ThamSo();

  someConditionHere: boolean = true;
  ListGioHang: any;
  SoLuong: number = 0;
  TongGia: number = 0;
  TongHoaDon: number = 0;

  loaiShip: string = '1'; 
  loaiThanhToan: number = 1;
  Ten: string = '';
  DiaChi: string = '';
  SDT: string = '';
  GhiChu: string = '';
  isTermsChecked: boolean = false;

  user: any;

  constructor(
    private phuongThucService: PhuongThucService,
    private donHangService: DonHangService,
    private authService: AuthService,
    private vnPayService: VnPayService,
    private sanPhamService: SanPhamService,
    private thamsoService: ThamsoService,
    private cartService: CartService,
    private router: Router
  ) {}

  ngOnInit(){
    this.getall();
    this.loadUser();
    this.loadThamSo();
    this.loadGioHang();
  }

  //Thanh toán
  ThanhToan() {
    if (!this.isTermsChecked) {
        swal.fire({
            icon: 'warning',
            title: 'Cảnh báo',
            text: 'Vui lòng đọc và đồng ý với các điều khoản của website.'
        });
    } else if (!this.user.ten || !this.user.diaChi || !this.user.sdt) {
        swal.fire({
            icon: 'warning',
            title: 'Cảnh báo',
            text: 'Vui lòng điền đầy đủ thông tin.'
        });
    } else {
        swal.fire({
            icon: 'question',
            title: 'Xác nhận thanh toán',
            text: 'Bạn có chắc chắn muốn thanh toán không?',
            showCancelButton: true,
            confirmButtonText: 'Thanh toán',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                this.createDonHang();
            }
        });
    }
  }

  async createDonHang() {
    let allInStock = true;
    
    swal.fire({
      icon: 'info',
      title: 'Đang xử lý',
      text: 'Đơn hàng của bạn đang được xử lý',
      timer: 10000,
      timerProgressBar: true,
      didOpen: () => {
        swal.showLoading()
      }
    });

    // Kiểm tra số lượng tồn kho của từng sản phẩm trong giỏ hàng
    for (let item of this.ListGioHang) {
      try {
        const res = await this.sanPhamService.getbyid(item.id).toPromise();
        if (item.soluong > res.data.soLuong) {
          allInStock = false;
          swal.fire({
            icon: 'error',
            title: 'Cảnh báo',
            text: 'Một số sản phẩm trong giỏ hàng không có đủ số lượng. Vui lòng kiểm tra lại giỏ hàng của bạn.'
          }).then(() => {
            this.router.navigate(['/cart']);
          });
          return; 
        }
      } catch (error) {
        console.error('Error checking product stock:', error);
        swal.fire({
          icon: 'error',
          title: 'Lỗi',
          text: 'Đã xảy ra lỗi khi kiểm tra số lượng tồn kho. Vui lòng thử lại sau.'
        });
        return;
      }
    }
  
    if (!allInStock) {
      return;
    }
  
    const donhang: any = {
      ten: this.user.ten,
      diaChi: this.user.diaChi,
      sdt: this.user.sdt,
      kieuGiaoHang: Number(this.loaiShip),
      ghiChu: this.GhiChu,
      trangThai: this.loaiThanhToan === 2 ? 3 : 0,
      idPhuongThuc: this.loaiThanhToan,
      idNguoiDung: this.user.id,
    };

    try {
      const res = await this.donHangService.createDonHang(donhang).toPromise();
      const newOrderRes = await this.donHangService.getnew().toPromise();
      const id = newOrderRes.data.id;
  
      for (let i = 0; i < this.ListGioHang.length; i++) {
        const ctdonhang: any = {
          soLuong: this.ListGioHang[i].soluong,
          gia: this.ListGioHang[i].gia,
          idSanPham: this.ListGioHang[i].id,
          idDonHang: id,
        };
        await this.giamSoLuong(this.ListGioHang[i].id, this.ListGioHang[i].soluong);
        await this.donHangService.createCTDonHang(ctdonhang).toPromise();
      }
  
      const email: any = {
        email: this.user.email,
        confirmationLink: `${window.location.origin}/tracuudonhang`,
        id: id
      };
  
      switch (this.loaiShip) {
        case '1':
          email.ship = Number(this.thongthuong.noiDung); break;
        case '2':
          email.ship = Number(this.tietkiem.noiDung); break;
        case '3':
          email.ship = Number(this.nhanh.noiDung); break;
        default: break;
      }
  
      await this.donHangService.orderEmail(email).toPromise();
  
      if (this.loaiThanhToan === 2) {
        this.vnPay(id);
      }
  
      localStorage.removeItem('cart');
      this.cartService.load();
  
      swal.fire({
        icon: 'success',
        title: 'Thành công!',
        text: 'Đặt hàng thành công! Đang xử lý',
        timer: 3000,
        timerProgressBar: true,
        didOpen: () => {
          swal.showLoading()
        }
      }).then((result) => {
        if (result.dismiss === swal.DismissReason.timer) {}
        if (this.loaiThanhToan === 1) {
          this.router.navigate(['/']);
        }
      });
    } catch (error) {
      console.error('Error creating order:', error);
      swal.fire({
        icon: 'error',
        title: 'Lỗi',
        text: 'Đã xảy ra lỗi khi tạo đơn hàng. Vui lòng thử lại sau.'
      });
    }
  }

  //Thanh toán online
  vnPay(id: number){
    const payment: PaymentInformation = {
      orderId: id,
      name: this.user.ten,
      amount: this.TongHoaDon,
      orderDescription: this.GhiChu,
      orderType: "other",
      url: `${window.location.origin}/camon`
    }

    this.vnPayService.vnpay(payment).subscribe(res => { 
      if(res.success){
        window.location.href = res.data;
      }
      else{
        swal.fire({
          icon: 'warning',
          title: 'Cảnh báo',
          text: res.message
      });
      }
    });
  }

  async giamSoLuong(id: number, soluong: number) {
    try {
      const res = await this.sanPhamService.getbyid(id).toPromise();
      const formData = new FormData();
      formData.append('id', id.toString());
      formData.append('soLuong', (Number(res.data.soLuong) - Number(soluong)).toString());
      await this.sanPhamService.updateQuantity(formData).toPromise();
    } catch (error) {
      console.error('Error updating product quantity:', error);
    }
  }

  //Đồng ý với các điều khoản
  onTermsChange(event: any) {
      this.isTermsChecked = event.target.checked;
  }

  //Load người dùng
  loadUser() {
    this.user = this.authService.loadUser();
  }  
  
  //Load giỏ hàng
  loadGioHang() {
    let cart: any[] = JSON.parse(localStorage.getItem('cart') || '[]');
    this.ListGioHang = cart;
    this.SoLuong = cart.reduce((total, item) => total + item.soluong, 0);
    this.TongGia = cart.reduce((total, item) => total + (item.gia * item.soluong), 0);
    this.TongHoaDon = this.TongGia + Number(this.thongthuong.noiDung);

    if(this.SoLuong === 0){
      alert("Bạn chưa mua sản phẩm nào, vui lòng quay lại sau");
      this.router.navigate(['/']);
    }
  } 

  //Lấy toàn bộ phương thức
  getall() {
    this.phuongThucService.get().subscribe(res => {
      this.ListPhuongThuc = res.data;
    });
  }

  updateTotalAmount() {
    switch (this.loaiShip) {
      case '1':
          this.TongHoaDon = this.TongGia + Number(this.thongthuong.noiDung); break;
      case '2':
          this.TongHoaDon = this.TongGia + Number(this.tietkiem.noiDung); break;
      case '3':
          this.TongHoaDon = this.TongGia + Number(this.nhanh.noiDung);break;
      default: break;
    }
  }

  //Tham số
  loadThamSo() {
    forkJoin({
      thongthuong: this.thamsoService.getbyma('REGULAR_DELIVERY'),
      tietkiem: this.thamsoService.getbyma('ECONOMICAL_DELIVERY'),
      nhanh: this.thamsoService.getbyma('FAST_DELIVERY')
    }).subscribe(res => {
      this.thongthuong = res.thongthuong.data;
      this.tietkiem = res.tietkiem.data;
      this.nhanh = res.nhanh.data;

      if (isNaN(Number(this.thongthuong.noiDung))) {
        console.error('Invalid value for thongthuong.noiDung:', this.thongthuong.noiDung);
      } else {
        this.TongHoaDon = this.TongGia + Number(this.thongthuong.noiDung);
        this.updateTotalAmount();
      }
    });
  }  
}
