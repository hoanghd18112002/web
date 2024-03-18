import { Component, ElementRef, ViewChild } from '@angular/core';
import { NguoiDung } from 'src/app/models/nguoidung.model';
import { Quyen } from 'src/app/models/quyen.model';
import { NguoiDungService } from 'src/app/service/nguoidung.service';
import { QuyenService } from 'src/app/service/quyen.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlnguoidung',
  templateUrl: './qlnguoidung.component.html',
  styleUrls: ['./qlnguoidung.component.css']
})
export class QlnguoidungComponent {
  ListNguoiDung: NguoiDung[] = [];
  ListQuyen: Quyen[] = [];
  
  taiKhoan: string = '';
  matKhau: string = '';
  email: any = null;
  ten: string = '';
  ngayTao: string = '';
  diaChi: string = '';
  sdt: string = '';
  gioiTinh: string = "1";
  anh: any = null;
  trangThai: number = 1;
  idQuyen: number = 1;
  tenQuyen: string = '';

  id: any = null;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  totalPages: number = 0;
  totalPagesArray: number[] = [];
  visiblePages: number[] = [];

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('resetModal') resetModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(
    private nguoiDungService: NguoiDungService, 
    private quyenService: QuyenService
  ){}

  ngOnInit(){
    this.getquyen();
    this.getall(null);
  }

  //File
  onFileChange(event: any) {
    const fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.anh = fileList[0];
    }
  }

  //Lấy danh sách toàn bộ
  getall(idQuyen: any){
    const obj = {
      page: this.p,
      pageSize: this.pageSize,
      ten: this.searchTerm,
      idQuyen: idQuyen
    };
    this.nguoiDungService.getall(obj).subscribe(res => {
      this.ListNguoiDung = res.data;
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
    this.getall(this.id);
  }

  //Chọn quyền
  onSelectChange(event: any) {
    this.id = event.target.value === 'null' ? null : event.target.value;
    this.idQuyen = this.id
    if (this.id === "null") {
        this.getall(null);
    } else {
        this.getall(this.id);
    }
  }

  //Lấy danh sách quyền
  getquyen(){
    this.quyenService.get().subscribe(res => {
      this.ListQuyen = res.data;
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.taiKhoan = '';
    this.email= null;
    this.ten = '';
    this.ngayTao = '';
    this.diaChi = '';
    this.sdt = '';
    this.gioiTinh = "1";
    this.anh = null;
    this.trangThai = 1;
    this.idQuyen = 2;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.taiKhoan || !this.email || !this.ten || !this.diaChi || !this.sdt ) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const nguoidung: any = {
      taiKhoan: this.taiKhoan,
      matKhau: '123456',
      email: this.email,
      ten: this.ten,
      diaChi: this.diaChi,
      sdt: this.sdt,
      gioiTinh: this.gioiTinh.toString(),
      trangThai: this.trangThai ? '1' : '0',
      idQuyen: this.idQuyen,
      confirmationLink: `${window.location.origin}/confirm`
    }

    this.id = this.idQuyen;

    this.nguoiDungService.create(nguoidung).subscribe(res => {
      if (res.success) {
        swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: res.message
        }).then(() => {
          this.getall(this.id);
        });
      } else{
        swal.fire({
          icon: 'error',
          title: 'Lỗi',
          text: res.message
      }).then(() => {
          
      });
      }

      this.getall(this.id);
  
      // Đóng modal khi tạo thành công
      const addModal = this.addModal.nativeElement;
      addModal.classList.remove('show');
      addModal.style.display = 'none';
      document.body.classList.remove('modal-open');
      const modalBackdrop = document.getElementsByClassName('modal-backdrop');
      for (let i = 0; i < modalBackdrop.length; i++) {
        modalBackdrop[i].remove();
      }
    });
  }

  //Sửa
  update() {
    if (this.selectedRow) {
      if (!this.taiKhoan || !this.email || !this.ten || !this.diaChi || !this.sdt ) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }

      this.id = this.idQuyen;

      const formData = new FormData();
      
      formData.append('id', String(this.selectedRow.id));
      formData.append('ten', this.ten);
      formData.append('diaChi', this.diaChi);
      formData.append('sdt', this.sdt);
      formData.append('gioiTinh', this.gioiTinh.toString());
      formData.append('trangThai', this.trangThai ? '1' : '0');
      formData.append('idQuyen', this.id);

      // Gọi phương thức sửa từ service
      this.nguoiDungService.update(formData).subscribe(res => {
        this.getall(this.id);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        this.selectedRow = null;

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

  //Sửa
  reset() {
    if (this.selectedRow) {

      this.id = this.idQuyen;

      const formData = new FormData();
      formData.append('id', String(this.selectedRow.id));
      formData.append('matKhau', '123456');

      // Gọi phương thức sửa từ service
      this.nguoiDungService.update(formData).subscribe(res => {
        this.getall(this.id);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        this.selectedRow = null;

        // Đóng modal khi tạo thành công
        const resetModal = this.resetModal.nativeElement;
        resetModal.classList.remove('show');
        resetModal.style.display = 'none';
        document.body.classList.remove('modal-open');
        const modalBackdrop = document.getElementsByClassName('modal-backdrop');
        for (let i = 0; i < modalBackdrop.length; i++) {
          modalBackdrop[i].remove();
        }
      });
    }
  }

  //Xoá
  delete() {
    if (this.selectedRow) {
      const id = this.selectedRow.id; // Lấy id để xoá
      this.id = this.idQuyen;
      // Gọi phương thức xoá từ service    
      this.nguoiDungService.detele(id).subscribe(res => {
        this.getall(this.id);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        this.selectedRow = null;
        
        // Đóng modal khi tạo thành công
        const deleteModal = this.deleteModal.nativeElement;
        deleteModal.classList.remove('show');
        deleteModal.style.display = 'none';
        document.body.classList.remove('modal-open');
        const modalBackdrop = document.getElementsByClassName('modal-backdrop');
        for (let i = 0; i < modalBackdrop.length; i++) {
          modalBackdrop[i].remove();
        }
      });
    }
  }

  // Xử lý khi ấn vào dòng
  selectedRow: NguoiDung | null = null;

  onRowClick(nguoiDung: NguoiDung) {
    this.selectedRow = nguoiDung;

    this.taiKhoan = this.selectedRow.taiKhoan;
    this.email= this.selectedRow.email;
    this.ten = this.selectedRow.ten;
    this.ngayTao = this.formatDate(this.selectedRow.ngayTao);
    this.diaChi = this.selectedRow.diaChi;
    this.sdt = this.selectedRow.sdt;
    this.gioiTinh = this.selectedRow.gioiTinh.toString();
    this.anh = this.selectedRow.anh;
    this.trangThai = this.selectedRow.trangThai;
    this.idQuyen = this.selectedRow.idQuyen;
    this.tenQuyen = this.selectedRow.tenQuyen;
  }

  formatDate(date: string): string {
    const originalDate = new Date(date);
    originalDate.setDate(originalDate.getDate() + 1);
    const formattedDate = originalDate.toISOString().slice(0, 10);
    return formattedDate;
  }

  modalTagel: string = "#messageModal"; //Mặc định nếu chưa chọn 1 dòng dữ liệu thì hiện thông báo
  // Hàm xử lý đã chọn 1 dòng dữ liệu chưa, 1 là xem, 2 là sửa, 3 là xoá
  viewClick(number: any) {
    if (this.selectedRow !== null) {
      if(number == 1)
      {
        this.modalTagel = "#viewModal";
      }
      else if(number == 2)
      {
        this.modalTagel = "#updateModal";
      }
      else if(number == 3)
      {
        this.modalTagel = "#deleteModal";
      }
      else if(number == 4)
      {
        this.modalTagel = "#resetModal";
      }
    }
    else{
      this.modalTagel = "#messageModal"
    }
  }
}
