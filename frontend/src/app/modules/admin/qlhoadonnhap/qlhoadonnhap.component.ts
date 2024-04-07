import { Component, ElementRef, ViewChild  } from '@angular/core';
import { CTHoaDonNhap } from 'src/app/models/cthoadonnhap.model';
import { HoaDonNhap } from 'src/app/models/hoadonnhap.model';
import { HoaDonNhapService } from 'src/app/service/hoadonnhap.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlhoadonnhap',
  templateUrl: './qlhoadonnhap.component.html',
  styleUrls: ['./qlhoadonnhap.component.css']
})
export class QlhoadonnhapComponent {
  ListHoaDonNhap: HoaDonNhap[] = [];
  ListCTHoaDonNhap: CTHoaDonNhap[] = [];
  
  ngayNhap: Date = new Date;
  idNhaCungCap: number = 0;
  idNguoiDung: number = 0;
  tenNhaCungCap: string = '';
  tenNguoiDung: string = '';

  soluong: number = 0;
  tongTien: number = 0;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private hoaDonNhapService: HoaDonNhapService){}

  ngOnInit(){
    this.getall(this.p);
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize
    };
    this.hoaDonNhapService.getall(obj).subscribe(res => {
      this.ListHoaDonNhap = res.data;
      this.totalItems = res.totalItems;
      this.p = p
    });
  }

  exportToExcel() {
    const id = Number(this.selectedRow?.id);
    this.hoaDonNhapService.excel(id).subscribe((data: Blob) => {
      const url = window.URL.createObjectURL(data);
      const link = document.createElement('a');
      link.href = url;
      link.download = `hoadonnhap${id}.xlsx`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }, error => {
      console.error('Đã xảy ra lỗi khi xuất Excel:', error);
      // Xử lý lỗi
    });
  }

  // Xử lý khi ấn vào dòng
  selectedRow: HoaDonNhap | null = null;

  onRowClick(hoadonnhap: HoaDonNhap) {
    this.selectedRow = hoadonnhap;

    this.ngayNhap = this.selectedRow.ngayNhap;
    this.idNhaCungCap = this.selectedRow.idNhaCungCap;
    this.idNguoiDung = this.selectedRow.idNguoiDung;
    this.tenNhaCungCap = this.selectedRow.tenNhaCungCap;
    this.tenNguoiDung = this.selectedRow.tenNguoiDung;
    this.tongTien = this.selectedRow.tongTien;

    this.hoaDonNhapService.getbyhoadonnhap(this.selectedRow.id).subscribe(res => {
      this.ListCTHoaDonNhap = res.data;

      this.soluong = 0;

      for (const item of this.ListCTHoaDonNhap) {
        this.soluong += item.soLuong;
      }
    });
  }

  modalTagel: string = "#messageModal"; //Mặc định nếu chưa chọn 1 dòng dữ liệu thì hiện thông báo
  // Hàm xử lý đã chọn 1 dòng dữ liệu chưa, 1 là xem, 2 là sửa, 3 là xoá
  viewClick(number: any) {
    if (this.selectedRow) {
      if(number == 1)
      {
        this.modalTagel = "#viewModal";
      }
    }
  }
}
