import { Component, ElementRef, ViewChild } from '@angular/core';
import { GiamGia } from 'src/app/models/giamgia.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { GiamGiaService } from 'src/app/service/giamgia.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlgiamgia',
  templateUrl: './qlgiamgia.component.html',
  styleUrls: ['./qlgiamgia.component.css']
})
export class QlgiamgiaComponent {
  ListSanPham: SanPham[] = [];
  GiamGia: GiamGia[] = [];
  
  btnLuu: boolean = true;
  btnXoa: boolean = true;
  readonly: boolean = true;
  
  id: number = 0;
  phanTram: number = 0;
  ngayBatDau: string = '';
  ngayKetThuc: string = '';
  idSanPham: number = 0;
  tenSanPham: string = '';

  isGiamGia: boolean = true;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('saveModal') saveModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(
    private giamGiaService: GiamGiaService, 
    private sanPhamService: SanPhamService
  ){}

  ngOnInit(){
    this.getsanpham(this.p);
  }

  //Lấy danh sách toàn bộ
  getsanpham(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      ten: this.searchTerm
    };
    this.sanPhamService.getall(obj).subscribe(res => {
      this.ListSanPham = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
  }

  //Lưu
  save() {
    if (this.selectedRow) {
      if (!this.phanTram || !this.ngayBatDau || !this.ngayKetThuc) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const giamgia: any = {
        id: this.id,
        phanTram: this.phanTram,
        ngayBatDau: this.ngayBatDau,
        ngayKetThuc: this.ngayKetThuc,
        idSanPham: this.selectedRow.id,
      }
      
      if(this.isGiamGia){
        // Gọi phương thức sửa từ service
        this.giamGiaService.create(giamgia).subscribe(res => {
          swal.fire({
            icon: 'success',
            title: res.message,
            showConfirmButton: true,
            timer: 1500
          });(res.message);
          this.getsanpham(this.p)
        });
      }
      else{
        // Gọi phương thức sửa từ service
        this.giamGiaService.update(giamgia).subscribe(res => {
          swal.fire({
            icon: 'success',
            title: res.message,
            showConfirmButton: true,
            timer: 1500
          });(res.message);
          this.getsanpham(this.p)
        });
      }

      this.tenSanPham = this.selectedRow.ten;
      this.getsanpham(this.p)
      
      this.closeModal(this.saveModal);
    }
  }

  //Xoá
  delete() {
    if (this.selectedRow) {
      this.giamGiaService.detele(this.id).subscribe(res => {
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        
        this.phanTram = 0;
        this.ngayBatDau = '';
        this.ngayKetThuc = '';
        this.tenSanPham = '';

        this.getsanpham(this.p);

        this.closeModal(this.deleteModal);
      });
    }
  }

  // Đóng modal dùng chung
  closeModal(modal: ElementRef) {
    const modalElement = modal.nativeElement;
    modalElement.classList.remove('show');
    modalElement.style.display = 'none';
    document.body.classList.remove('modal-open');
    Array.from(document.getElementsByClassName('modal-backdrop')).forEach(element => element.remove());
  }

  // Xử lý khi ấn vào dòng
  selectedRow: SanPham | null = null;

  onRowClick(sanPham: SanPham) {
    this.selectedRow = sanPham;

    this.giamGiaService.getbysanpham(this.selectedRow.id).subscribe(res => {
      if(res.data.length === 0){
        this.id = 0;
        this.phanTram = 0;
        this.ngayBatDau = '';
        this.ngayKetThuc = '';
        this.tenSanPham = '';

        this.btnLuu = false;
        this.btnXoa = true;
        this.readonly = false;

        this.isGiamGia = true;
      }
      else{
        this.id = res.data[0].id;
        this.phanTram = res.data[0].phanTram;
        this.ngayBatDau = this.formatDate(res.data[0].ngayBatDau);
        this.ngayKetThuc = this.formatDate(res.data[0].ngayKetThuc);
        this.tenSanPham = res.data[0].tenSanPham;

        this.btnLuu = false;
        this.btnXoa = false;
        this.readonly = false;

        this.isGiamGia = false;
      }
    });
  }

  formatDate(date: string): string {
    const originalDate = new Date(date);
    originalDate.setDate(originalDate.getDate() + 1);
    const formattedDate = originalDate.toISOString().slice(0, 10);
    return formattedDate;
  }
}