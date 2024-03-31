import { Component, ElementRef, ViewChild } from '@angular/core';
import { CTDonHang } from 'src/app/models/ctdonhang.model';
import { DonHang } from 'src/app/models/donhang.model';
import { PaymentInformation } from 'src/app/models/vnpayment.model';
import { AuthService } from 'src/app/service/auth.service';
import { DonHangService } from 'src/app/service/donhang.service';
import { NguoiDungService } from 'src/app/service/nguoidung.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { VnPayService } from 'src/app/service/vnpay.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-taikhoan',
  templateUrl: './taikhoan.component.html',
  styleUrls: ['./taikhoan.component.css']
})
export class TaikhoanComponent {
  ListDonHang: DonHang[] = [];
  ListCTDonHang: CTDonHang[] = [];

  user: any;
  p: number = 1;
  pageSize: number = 6;
  totalItems: number = 0;
  totalPages: number = 0;
  totalPagesArray: number[] = [];
  visiblePages: number[] = [];

  id: number = 0;
  ten: string = '';
  diaChi: string = '';
  sdt: string = '';
  ngayDat: Date = new Date;
  kieuGiaoHang: number = 0;
  ghiChu: string = '';
  tenPhuongThuc: string = '';
  trangThai = 0;

  ID: any;
  Email: string = '';
  TaiKhoan: string = '';
  Ten: string = '';
  DiaChi: string = '';
  SDT: string = '';
  NgayTao: string = '';
  GioiTinh: any;
  TenQuyen: string = '';
  Anh: any = null;

  MatKhauCu: string = '';
  MatKhauMoi: string = '';
  NhapLaiMatKhauMoi: string = '';

  Tong: number = 0;

  @ViewChild('updateModal') updateModal!: ElementRef;

  constructor(
    private donHangService: DonHangService, 
    private authService: AuthService, 
    private nguoiDungService: NguoiDungService,
    private vnPayService: VnPayService,
    private sanPhamService: SanPhamService
  ) {}

  ngOnInit(){
    this.loadUser();
  }

  //Thông tin đơn hàng
  thongTinDonHang(id: number) {
    this.donHangService.getbyid(id).subscribe(res => {

      this.id = res.data.id;
      this.ten = res.data.ten;
      this.diaChi = res.data.diaChi;
      this.sdt = res.data.sdt;
      this.ngayDat = res.data.ngayDat;
      this.kieuGiaoHang = res.data.kieuGiaoHang;
      this.ghiChu = res.data.ghiChu;
      this.tenPhuongThuc = res.data.tenPhuongThuc;
      this.trangThai = res.data.trangThai;
      this.Tong = res.data.tongTien;

      this.donHangService.getbydonhang(id).subscribe(res => {
        this.ListCTDonHang = res.data;
      });
    });
  }

  //Sửa thông tin người dùng
  edit() {
    if (!this.DiaChi || !this.Ten || !this.SDT) {
        // Thông báo khi thông tin không đầy đủ
        swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Vui lòng điền đầy đủ thông tin có dấu đỏ.'
        });
        return;
    }

    const formData = new FormData();

    formData.append('id', this.ID);
    formData.append('diaChi', this.DiaChi);
    formData.append('ten', this.Ten);
    formData.append('sdt', this.SDT);
    formData.append('gioiTinh', this.GioiTinh);

    if (this.Anh && this.Anh.size > 0) {
      formData.append('file', this.Anh, this.Anh.name);
    }

    if (this.MatKhauCu) {
      const check: any = {
          taiKhoan: this.user.taiKhoan,
          matKhau: this.MatKhauCu,
      }
      this.authService.login(check).subscribe(res => {
          if (res.success === false) {
              // Thông báo khi mật khẩu không chính xác
              swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Mật khẩu không chính xác.'
              });
          } else {
              //Kiểm tra có nhập mật khẩu mới không
              if (this.MatKhauMoi && this.NhapLaiMatKhauMoi) {
                  //Kiểm tra nhật khẩu mới có trùng không
                  if (this.MatKhauMoi === this.NhapLaiMatKhauMoi) {
                      //Đổi mật khẩu
                      formData.append('matKhau', this.MatKhauMoi);
                      this.nguoiDungService.update(formData).subscribe(res => { });
                      this.out();
                  } else {
                      // Thông báo khi mật khẩu mới không trùng khớp
                      swal.fire({
                          icon: 'error',
                          title: 'Lỗi',
                          text: 'Mật khẩu mới không trùng khớp.'
                      });
                  }
              }
              //Thay đổi thông tin
              else {
                  this.nguoiDungService.update(formData).subscribe(res => { });
                  this.out();
              }
          }
        });
    } else {
        // Thông báo khi chưa nhập mật khẩu để sửa thông tin
        swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: 'Vui lòng nhập mật khẩu để sửa thông tin.'
        });
    }
  }

  out() {
    swal.fire({
        icon: 'success',
        title: 'Thành công',
        text: 'Thay đổi thông tin thành công, website sẽ tự động đăng xuất.',
        showConfirmButton: false
    });
    setTimeout(() => {
        this.authService.logout();
        location.reload();
    }, 3000); 
  }

  //Sửa
  update(id: number) {
    // Tạo một đối tượng từ dữ liệu được chọn
    const donhang: any = {
      id: id,
      trangThai: 2,
    };

    this.donHangService.update(donhang).subscribe(res => {
      for(var i = 0; i < this.ListCTDonHang.length; i++){
        this.giamSoLuong(this.ListCTDonHang[i].id, this.ListCTDonHang[i].soLuong) ;
      }
      this.loadUser();
      
      // Hiển thị thông báo thành công bằng SweetAlert2
      swal.fire({
          icon: 'success',
          title: 'Huỷ thành công',
          text: res.message
      });

      // Đóng modal khi tạo thành công
      const updateModal = this.updateModal.nativeElement;
      updateModal.classList.remove('show');
      updateModal.style.display = 'none';
      document.body.classList.remove('modal-open');
      const modalBackdrop = document.getElementsByClassName('modal-backdrop');
      for (let i = 0; i < modalBackdrop.length; i++) {
          modalBackdrop[i].remove();
      }
    });
  }

  giamSoLuong(id: number, soluong: number){
    this.sanPhamService.getbyid(id).subscribe(res => { 
      const formData = new FormData();
      formData.append('id', id.toString());
      formData.append('soLuong', (res.data.soLuong + soluong).toString());
      
      this.sanPhamService.update(formData).subscribe(res => {})
    })
  }

  //Thanh toán online
  vnPay(id: number){
    const payment: PaymentInformation = {
      orderId: id,
      name: this.ten,
      amount: this.Tong,
      orderDescription: this.ghiChu,
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
  
  //Load người dùng
  loadUser() {
    this.user = this.user = this.authService.loadUser();
    if (this.user) {

      this.ID = this.user.id;
      this.Email = this.user.email;
      this.TaiKhoan = this.user.taiKhoan;
      this.Anh = this.user.anh;
      this.Ten = this.user.ten;
      this.DiaChi = this.user.diaChi;
      this.SDT = this.user.sdt;
      this.NgayTao = this.formatDate(this.user.ngayTao);
      this.GioiTinh = this.user.gioiTinh;
      this.TenQuyen = this.user.tenQuyen;

      this.loadDonHang(this.user.id);
    }
  } 

  loadDonHang(id: number) {
    const obj = {
      page: this.p,
      pageSize: this.pageSize,
      id: id
    };
    this.donHangService.getByNguoiDung(obj).subscribe(res => {
      this.ListDonHang = res.data;
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
    this.loadDonHang(this.user.id);
  }

  //File
  onFileChange(event: any) {
    const fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.Anh = fileList[0];
    }
  }

  //Đăng xuất
  deleteUser() {
    this.authService.logout();
  }  

  formatDate(date: string): string {
    const originalDate = new Date(date);
    originalDate.setDate(originalDate.getDate() + 1);
    const formattedDate = originalDate.toISOString().slice(0, 10);
    return formattedDate;
  }
}
