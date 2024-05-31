import { Component, ElementRef, ViewChild  } from '@angular/core';
import { DieuKhoan } from 'src/app/models/dieukhoan.model';
import { DieuKhoanService } from 'src/app/service/dieukhoan.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qldieukhoan',
  templateUrl: './qldieukhoan.component.html',
  styleUrls: ['./qldieukhoan.component.css']
})
export class QldieukhoanComponent {
  ListDieuKhoan: DieuKhoan[] = [];
  
  noiDung: string = '';
  kieu: any = '';
  trangThai = 1;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private dieuKhoanService: DieuKhoanService){}

  ngOnInit(){
    this.getall(this.p);
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      noiDung: this.searchTerm,
    };
    this.dieuKhoanService.getall(obj).subscribe(res => {
      this.ListDieuKhoan = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.noiDung = '';
    this.kieu = '';
    this.trangThai = 1;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.noiDung || !this.kieu) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const dieukhoan: any = {
      noiDung: this.noiDung,
      kieu: this.kieu,
      trangThai: this.trangThai ? 1 : 0,
    }
    
    this.dieuKhoanService.create(dieukhoan).subscribe(res => {
      this.getall(this.p);
      swal.fire({
        icon: 'success',
        title: res.message,
        showConfirmButton: true,
        timer: 1500
      });(res.message);
  
      this.closeModal(this.addModal);
    });
  }

  //Sửa
  update() {
    if (this.selectedRow) {
      if (!this.noiDung || !this.kieu) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const dieukhoan: any = {
        id: this.selectedRow.id,
        noiDung: this.noiDung,
        kieu: this.kieu,
        trangThai: this.trangThai ? 1 : 0,
      };
      
      // Gọi phương thức sửa từ service
      this.dieuKhoanService.update(dieukhoan).subscribe(res => {
        this.getall(this.p);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        this.selectedRow = null;

        this.closeModal(this.updateModal);
      });
    }
  }

  //Xoá
  delete() {
    if (this.selectedRow) {
      const id = this.selectedRow.id; // Lấy id để xoá
      // Gọi phương thức xoá từ service
      this.dieuKhoanService.detele(id).subscribe(res => {
        this.getall(this.p);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
        this.selectedRow = null;
        
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
  selectedRow: DieuKhoan | null = null;

  onRowClick(dieuKhoan: DieuKhoan) {
    this.selectedRow = dieuKhoan;

    this.noiDung = this.selectedRow.noiDung;
    this.kieu = this.selectedRow.kieu;
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
