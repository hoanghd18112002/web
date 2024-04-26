import { Component } from '@angular/core';
import { PhuongThuc } from 'src/app/models/phuongthuc.model';
import { DonHangService } from 'src/app/service/donhang.service';
import { PhuongThucService } from 'src/app/service/phuongthuc.service';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';
import { VnPayService } from 'src/app/service/vnpay.service';
import { PaymentInformation } from 'src/app/models/vnpayment.model';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { Router } from '@angular/router';

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
    private sanPhamService: SanPhamService,
    private router: Router
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
                this.createDonHang();
            }
        });
    }
  }

  createDonHang() {
    let enoughStock = true;
  
    // Kiểm tra số lượng tồn kho của từng sản phẩm trong giỏ hàng
    for (let item of this.ListGioHang) {
      this.sanPhamService.getbyid(item.id).subscribe(res => {
        if (item.soluong > res.data.soLuong) {
          enoughStock = false;
          return;
        }
      });
  
      if (!enoughStock) {
        break;
      }
    }
  
    if (enoughStock) {
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

      // Gọi phương thức tạo đơn hàng
      this.donHangService.createDonHang(donhang).subscribe(res => {
        // Xử lý sau khi tạo đơn hàng thành công
        this.donHangService.getnew().subscribe(res => {
          const id = res.data.id;
          for (let i = 0; i < this.ListGioHang.length; i++) {
            const ctdonhang: any = {
              soLuong: this.ListGioHang[i].soluong,
              gia: this.ListGioHang[i].gia,
              idSanPham: this.ListGioHang[i].id,
              idDonHang: id,
            };
            this.giamSoLuong(this.ListGioHang[i].id, this.ListGioHang[i].soluong);
            this.donHangService.createCTDonHang(ctdonhang).subscribe(res => {});
          }

          const email: any = {
            email: this.user.email,
            confirmationLink: `${window.location.origin}/tracuudonhang`,
            id: id
          };
          this.donHangService.orderEmail(email).subscribe(res => {});

          if (this.loaiThanhToan === 2) {
            this.vnPay(id);
          }
        });
      });
  
      localStorage.removeItem('cart');
      swal.fire({
        icon: 'success',
        title: 'Thành công!',
        text: 'Thanh toán thành công! Đang xử lý',
        timer: 5000, 
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
    } else {
      swal.fire({
        icon: 'error',
        title: 'Cảnh báo',
        text: 'Một số sản phẩm trong giỏ hàng không có đủ số lượng. Vui lòng kiểm tra lại giỏ hàng của bạn.'
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

  giamSoLuong(id: number, soluong: number){
    this.sanPhamService.getbyid(id).subscribe(res => { 
      const formData = new FormData();
      formData.append('id', id.toString());
      formData.append('soLuong', (Number(res.data.soLuong) - Number(soluong)).toString());
      
      this.sanPhamService.update(formData).subscribe(res => {})
    })
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
