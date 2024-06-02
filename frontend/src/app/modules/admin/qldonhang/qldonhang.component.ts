import { Component, ElementRef, ViewChild  } from '@angular/core';
import { CTDonHang } from 'src/app/models/ctdonhang.model';
import { DonHang } from 'src/app/models/donhang.model';
import { DonHangService } from 'src/app/service/donhang.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qldonhang',
  templateUrl: './qldonhang.component.html',
  styleUrls: ['./qldonhang.component.css']
})
export class QldonhangComponent {
  ListDonHang: DonHang[] = [];
  ListCTDonHang: CTDonHang[] = [];
  
  id: number = 0;
  ten: string = '';
  diaChi: string = '';
  sdt: string = '';
  ngayDat: Date = new Date;
  kieuGiaoHang: number = 0;
  ghiChu: string = '';
  tenPhuongThuc: string = '';
  taiKhoan: string = '';
  trangThai = 0;

  Tong: number = 0;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(
    private donHangService: DonHangService,
    private sanPhamService: SanPhamService,
  ){}

  ngOnInit(){
    this.getall(this.p);
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      id: this.searchTerm
    };
    this.donHangService.getall(obj).subscribe(res => {
      this.ListDonHang = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
      console.log(this.ListDonHang);
    });
  }

  //Sửa
  update(trangThai: number) {
    // Tạo một đối tượng từ dữ liệu được chọn
    const donhang: any = {
      id: this.selectedRow?.id,
      trangThai: trangThai,
    };
    if (this.selectedRow) {  
      // Gọi phương thức sửa từ service
      this.donHangService.update(donhang).subscribe(res => {
        this.getall(this.p);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        
        if(trangThai === 2){
          for(var i = 0; i < this.ListCTDonHang.length; i++){
            this.tangSoLuong(this.ListCTDonHang[i].idSanPham, this.ListCTDonHang[i].soLuong) ;
          }
        }

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
  }

  tangSoLuong(id: number, soluong: number){
    this.sanPhamService.getbyid(id).subscribe(res => { 
      const formData = new FormData();
      formData.append('id', id.toString());
      formData.append('soLuong', (Number(res.data.soLuong) + Number(soluong)).toString());
      
      this.sanPhamService.update(formData).subscribe(res => {})
    })
  }

  exportToExcel() {
    const id = Number(this.selectedRow?.id);
    this.donHangService.excel(id).subscribe((data: Blob) => {
      const url = window.URL.createObjectURL(data);
      const link = document.createElement('a');
      link.href = url;
      link.download = `donhang${id}.xlsx`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }, error => {
      console.error('Đã xảy ra lỗi khi xuất Excel:', error);
      // Xử lý lỗi
    });
  }
  
  // Xử lý khi ấn vào dòng
  selectedRow: DonHang | null = null;

  onRowClick(donHang: DonHang) {
    this.selectedRow = donHang;

    this.id = this.selectedRow.id;
    this.ten = this.selectedRow.ten;
    this.diaChi = this.selectedRow.diaChi;
    this.sdt = this.selectedRow.sdt;
    this.ngayDat = this.selectedRow.ngayDat;
    this.kieuGiaoHang = this.selectedRow.kieuGiaoHang;
    this.ghiChu = this.selectedRow.ghiChu;
    this.tenPhuongThuc = this.selectedRow.tenPhuongThuc;
    this.taiKhoan = this.selectedRow.taiKhoan;
    this.trangThai = this.selectedRow.trangThai;
    this.Tong = this.selectedRow.tongTien;

    this.donHangService.getbydonhang(this.selectedRow.id).subscribe(res => {
      this.ListCTDonHang = res.data;
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
