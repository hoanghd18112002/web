import { Component, ElementRef, ViewChild } from '@angular/core';
import { ThamSo } from 'src/app/models/thamso.model';
import { ThamsoService } from 'src/app/service/thamso.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlthamso',
  templateUrl: './qlthamso.component.html',
  styleUrls: ['./qlthamso.component.css']
})
export class QlthamsoComponent {
  ListThamSo: ThamSo[] = [];
  
  ma: any = '';
  ten: any = '';
  noiDung: any = '';
  anh: any = null;
  trangThai = 1;

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

  constructor(private thamsoService: ThamsoService){}

  ngOnInit(){
    this.getall();
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
      ten: this.searchTerm
    };
    this.thamsoService.getall(obj).subscribe(res => {
      this.ListThamSo = res.data;
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

  //Tạo mới xoá nội dung form
  loadForm(){
    this.ma = '';
    this.ten = '';
    this.noiDung = '';
    this.anh = null;
    this.trangThai = 1;

    this.selectedRow = null;
  }

  add() {
    if (!this.ma || !this.ten) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }
  
    // Kiểm tra mã có tồn tại không
    this.thamsoService.getbyma(this.ma).subscribe(existingData => {
      if (existingData) {
        alert('Mã đã tồn tại, vui lòng nhập mã khác.');
        return;
      }
  
      const formData = new FormData();
      formData.append('ma', this.ma);
      formData.append('ten', this.ten);
      formData.append('noiDung', this.noiDung);
      formData.append('file', this.anh!);
      formData.append('trangThai', this.trangThai ? '1' : '0');
  
      this.thamsoService.create(formData).subscribe(res => {
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
    });
  }  

  //Sửa
  update() {
    if (this.selectedRow) {
      const formData = new FormData();
      formData.append('id', String(this.selectedRow.id));
      formData.append('ma', this.ma);
      formData.append('ten', this.ten);
      formData.append('noiDung', this.noiDung);
      formData.append('file', this.anh!);
      formData.append('trangThai', this.trangThai ? '1' : '0');
      
      // Gọi phương thức sửa từ service
      this.thamsoService.update(formData).subscribe(res => {
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
      this.thamsoService.detele(id).subscribe(res => {
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
  selectedRow: ThamSo | null = null;

  onRowClick(thamSo: ThamSo) {
    this.selectedRow = thamSo;

    this.ma = this.selectedRow.ma;
    this.ten = this.selectedRow.ten;
    this.noiDung = this.selectedRow.noiDung;
    this.anh = this.selectedRow.anh;
    this.trangThai = this.selectedRow.trangThai;
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
