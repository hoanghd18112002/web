import { Component, ElementRef, ViewChild  } from '@angular/core';
import { TinTuc } from 'src/app/models/tintuc.model';
import { TinTucService } from 'src/app/service/tintuc.service';
import { AuthService } from 'src/app/service/auth.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qltintuc',
  templateUrl: './qltintuc.component.html',
  styleUrls: ['./qltintuc.component.css']
})
export class QltintucComponent {
  ListTinTuc: TinTuc[] = [];

  user: any;
  
  tieuDe: string = '';
  noiDung: string = '';
  ngayDang: Date = new Date;
  anh: any = null;
  trangThai = 1;
  idNguoiDung: any;
  ten: string = '';

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  totalPages: number = 0;
  totalPagesArray: number[] = [];
  visiblePages: number[] = [];

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(
    private tinTucService: TinTucService, 
    private authService: AuthService
  ){}

  ngOnInit(){
    this.getall();
    this.loadUser();
  }

  //File
  onFileChange(event: any) {
    const fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.anh = fileList[0];
    }
  }

  //Lấy danh sách toàn bộ
  getall(){
    const obj = {
      page: this.p,
      pageSize: this.pageSize,
      tieuDe: this.searchTerm
    };
    this.tinTucService.getall(obj).subscribe(res => {
      this.ListTinTuc = res.data;
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
    this.getall();
  }

  //Load người dùng
  loadUser() {
    this.user = this.authService.loadUser();
  }  

  //Tạo mới xoá nội dung form
  loadForm(){
    this.tieuDe = '';
    this.noiDung = '';
    this.anh = null;
    this.trangThai = 1;
    this.ten = this.user.Ten;
    this.idNguoiDung = this.user.ID;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.tieuDe || !this.noiDung || !this.anh) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const formData = new FormData();
    formData.append('tieuDe', this.tieuDe);
    formData.append('noiDung', this.noiDung);
    formData.append('file', this.anh!);
    formData.append('trangThai', this.trangThai ? '1' : '0');
    formData.append('idNguoiDung', this.user.id);

    this.tinTucService.create(formData).subscribe(res => {
      this.getall();
      swal.fire({
        icon: 'success',
        title: res.message,
        showConfirmButton: true,
        timer: 1500
      });(res.message);
  
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
      if (!this.tieuDe || !this.noiDung) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }

      const formData = new FormData();
      formData.append('id', String(this.selectedRow.id));
      formData.append('tieuDe', this.tieuDe);
      formData.append('noiDung', this.noiDung);
      formData.append('file', this.anh!);
      formData.append('trangThai', this.trangThai ? '1' : '0');
      formData.append('idNguoiDung', this.idNguoiDung);
      
      // Gọi phương thức sửa từ service
      this.tinTucService.update(formData).subscribe(res => {
        this.getall();
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

  //Xoá
  delete() {
    if (this.selectedRow) {
      const id = this.selectedRow.id; // Lấy id để xoá
      // Gọi phương thức xoá từ service
      this.tinTucService.detele(id).subscribe(res => {
        this.getall();
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
  selectedRow: TinTuc | null = null;

  onRowClick(tinTuc: TinTuc) {
    this.selectedRow = tinTuc;

    this.tieuDe = this.selectedRow.tieuDe;
    this.noiDung = this.selectedRow.noiDung;
    this.ngayDang = this.selectedRow.ngayDang;
    this.anh = this.selectedRow.anh;
    this.trangThai = this.selectedRow.trangThai;
    this.idNguoiDung = this.selectedRow.idNguoiDung;
    this.ten = this.selectedRow.ten;
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
    }
    else{
      this.modalTagel = "#messageModal"
    }
  }
}
