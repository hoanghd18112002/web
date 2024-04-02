import { Component } from '@angular/core';
import { NhaCungCap } from 'src/app/models/nhacungcap.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { HoaDonNhapService } from 'src/app/service/hoadonnhap.service';
import { NhaCungCapService } from 'src/app/service/nhacungcap.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-nhapsoluong',
  templateUrl: './nhapsoluong.component.html',
  styleUrls: ['./nhapsoluong.component.css']
})
export class NhapsoluongComponent {
  ListNhaCungCap: NhaCungCap[] = [];
  ListSanPham: SanPham[] = [];

  IDNhaCungCap: any = '';
  IDNguoiDung: any = '';
  diaChi: string = '';

  user: any;

  searchTerm: string = '';

  newChiTiet: { IDSanPham: number, Ten: string, SoLuong: number, Gia: number} = { IDSanPham: 0, Ten: '', SoLuong: 0, Gia: 0};
  chiTiet: { IDSanPham: number, Ten: string, SoLuong: number, Gia: number}[] = [];

  constructor(
    private nhaCungCapService: NhaCungCapService, 
    private authService: AuthService, 
    private sanPhamService: SanPhamService,
    private hoaDonNhapService: HoaDonNhapService,
  ){}

  ngOnInit(){
    this.getnhacungcap();
    this.loadUser();
    this.getsanpham();
  }

  //Thêm
  add() {
    if (!this.IDNhaCungCap) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const hoaDonNhap: any = {
      idNhaCungCap: Number(this.IDNhaCungCap),
      idNguoiDung: this.user.id,
    }
    this.hoaDonNhapService.create(hoaDonNhap).subscribe(res => {
      this.hoaDonNhapService.getnew().subscribe(res => {
        for (let i = 0; i < this.chiTiet.length; i++) {
          const ctHoaDonNhap: any = {
            soLuong: this.chiTiet[i].SoLuong,
            gia: this.chiTiet[i].Gia,
            idSanPham: this.chiTiet[i].IDSanPham,
            idHoaDonNhap: res.data.id,
          }
          this.hoaDonNhapService.createCTHoaDonNhap(ctHoaDonNhap).subscribe(res => {});

          const formData = new FormData();
          formData.append('id', this.chiTiet[i].IDSanPham.toString());
          formData.append('soLuong', this.chiTiet[i].SoLuong.toString());

          this.sanPhamService.update(formData).subscribe(res => {});
        }

        this.IDNhaCungCap = '';
        this.chiTiet.splice(0, this.chiTiet.length);
        swal.fire({
          icon: 'success',
          title: 'Nhập số lượng thành công',
          showConfirmButton: true,
          timer: 1500
        });
      });
    });
  }

  //Thêm chi tiết
  addChiTiet() {
    if (this.newChiTiet.IDSanPham && this.newChiTiet.SoLuong && this.newChiTiet.Gia) {
      this.sanPhamService.getbyid(this.newChiTiet.IDSanPham).subscribe(res => {
        const chitiet = { ...this.newChiTiet, Ten: res.data.ten };
        this.chiTiet.push(chitiet);
        this.newChiTiet = { IDSanPham: 0, Ten: '', SoLuong: 0, Gia: 0 };
      });
    } else {
      alert('Thông tin chi tiết không được để trống');
    }
  }

  //Xoá chi tiết
  deleteChiTiet(index: number): void {
    this.chiTiet.splice(index, 1);
  }

  //Lấy danh sách nhà cung cấp
  getnhacungcap(){
    this.nhaCungCapService.get().subscribe(res => {
      this.ListNhaCungCap = res.data;
    });
  }

  //Lấy danh sách sản phẩm
  getsanpham() {
    const obj = {
      page: 1,
      pageSize: 10,
      ten: this.searchTerm 
    };
    
    this.sanPhamService.getall(obj).subscribe(res => {
      this.ListSanPham = res.data;
    });
  }
  
  // Hàm được gọi khi có sự thay đổi trong trường tìm kiếm
  onSearchChange(event: any) {
    this.searchTerm = event.target.value;
    this.getsanpham(); 
  }

  //Load người dùng
  loadUser() {
    this.user = this.authService.loadUser();
  }  

  filteredSanPham: any[] = [];

  filterItems() {
    this.filteredSanPham = this.ListSanPham.filter(sp =>
      sp.ten.toLowerCase().includes(this.searchTerm.toLowerCase())
    );
  }
}
