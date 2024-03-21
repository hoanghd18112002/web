import { Component } from '@angular/core';
import { PhuongThuc } from 'src/app/models/phuongthuc.model';
import { DonHangService } from 'src/app/service/donhang.service';
import { PhuongThucService } from 'src/app/service/phuongthuc.service';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';
import { VnPayService } from 'src/app/service/vnpay.service';
import { PaymentInformation } from 'src/app/models/vnpayment.model';

@Component({
  selector: 'app-thanhtoan',
  templateUrl: './thanhtoan.component.html',
  styleUrls: ['./thanhtoan.component.css']
})
export class ThanhtoanComponent {
  ListPhuongThuc: PhuongThuc[] = [];

  someConditionHere: boolean = true;
  ListGioHang: any;
  SoLuong: number = 0;
  TongGia: number = 0;
  TongHoaDon: number = 0;

  loaiShip: string = '1'; 
  loaiThanhToan: number = 1;
  GhiChu: string = '';
  isTermsChecked: boolean = false;

  user: any;

  constructor(
    private phuongThucService: PhuongThucService,
    private donHangService: DonHangService,
    private authService: AuthService,
    private vnPayService: VnPayService,
  ) {}

  ngOnInit(){
    this.getall();
    this.loadUser();
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
                // Thực hiện tạo đơn hàng và xóa giỏ hàng khi người dùng xác nhận thanh toán
                this.createDonHang();
                // Thông báo thanh toán thành công
                swal.fire({
                    icon: 'success',
                    title: 'Thành công!',
                    text: 'Thanh toán thành công! Cảm ơn bạn đã sử dụng dịch vụ.'
                }).then(() => {
                    // // Chuyển hướng người dùng đến trang chủ sau khi thanh toán thành công
                    // location.assign('/');
                });
            }
        });
    }
  }

  //Thêm đơn hàng
  createDonHang(){
    const donhang: any = {
      ten: this.user.ten,
      diaChi: this.user.diaChi,
      sdt: this.user.sdt,
      kieuGiaoHang: Number(this.loaiShip),
      ghiChu: this.GhiChu,
      trangThai: 0,
      idPhuongThuc: this.loaiThanhToan,
      idNguoiDung: this.user.id,
    }
    this.donHangService.createDonHang(donhang).subscribe(res => {
      this.donHangService.getnew().subscribe(res => {
        const id = res.data.id
        for(let i = 0; i < this.ListGioHang.length; i++)
        {
          const ctdonhang: any = {
            soLuong: this.ListGioHang[i].soluong,
            gia: this.ListGioHang[i].gia,
            idSanPham: this.ListGioHang[i].id,
            idDonHang: id,
          }
          this.donHangService.createCTDonHang(ctdonhang).subscribe(res => {});
        }
        this.vnPay(id);
      });
    });
    localStorage.removeItem('cart');
  }

  //Thanh toán online
  vnPay(id: number){
    const payment: PaymentInformation = {
      orderId: id,
      name: this.user.ten,
      amount: this.TongHoaDon,
      orderDescription: this.GhiChu,
      orderType: "other",
      url: `${window.location.origin}/`
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
    this.TongHoaDon = this.TongGia + 100000;

    if(this.SoLuong === 0){
      alert("Bạn chưa mua sản phẩm nào, vui lòng quay lại sau");
      window.location.href = '/';
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
          this.TongHoaDon = this.TongGia + 100000; break;
      case '2':
          this.TongHoaDon = this.TongGia; break;
      case '3':
          this.TongHoaDon = this.TongGia + 200000;break;
      default: break;
    }
  }
}
