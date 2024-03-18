import { Component, ElementRef, ViewChild  } from '@angular/core';
import { NhaCungCap } from 'src/app/models/nhacungcap.model';
import { NhaCungCapService } from 'src/app/service/nhacungcap.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlnhacungcap',
  templateUrl: './qlnhacungcap.component.html',
  styleUrls: ['./qlnhacungcap.component.css']
})
export class QlnhacungcapComponent {
  ListNhaCungCap: NhaCungCap[] = [];
  
  ten: string = '';
  diaChi: string = '';
  sdt: string = '';
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

  constructor(private nhaCungCapService: NhaCungCapService){}

  ngOnInit(){
    this.getall();
  }

  //Lấy danh sách toàn bộ
  getall(){
    const obj = {
      page: this.p,
      pageSize: this.pageSize,
      ten: this.searchTerm
    };
    this.nhaCungCapService.getall(obj).subscribe(res => {
      this.ListNhaCungCap = res.data;
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
    this.ten = '';
    this.diaChi = '';
    this.sdt = '';
    this.trangThai = 1;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.ten || !this.diaChi || !this.sdt) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const nhacungcap: any = {
      ten: this.ten,
      diaChi: this.diaChi,
      sdt: this.sdt,
      trangThai: this.trangThai ? 1 : 0,
    }
  
    this.nhaCungCapService.create(nhacungcap).subscribe(res => {
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
      if (!this.ten || !this.diaChi || !this.sdt) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const nhacungcap: any = {
        id: this.selectedRow.id,
        ten: this.ten,
        diaChi: this.diaChi,
        sdt: this.sdt,
        trangThai: this.trangThai ? 1 : 0,
      };
      
      // Gọi phương thức sửa từ service
      this.nhaCungCapService.update(nhacungcap).subscribe(res => {
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
      this.nhaCungCapService.detele(id).subscribe(res => {
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
  selectedRow: NhaCungCap | null = null;

  onRowClick(nhacungcap: NhaCungCap) {
    this.selectedRow = nhacungcap;

    this.ten = this.selectedRow.ten;
    this.diaChi = this.selectedRow.diaChi;
    this.sdt = this.selectedRow.sdt;
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
