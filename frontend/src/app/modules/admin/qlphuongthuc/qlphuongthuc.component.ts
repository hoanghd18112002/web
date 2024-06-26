import { Component, ElementRef, ViewChild  } from '@angular/core';
import { PhuongThuc } from 'src/app/models/phuongthuc.model';
import { PhuongThucService } from 'src/app/service/phuongthuc.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlphuongthuc',
  templateUrl: './qlphuongthuc.component.html',
  styleUrls: ['./qlphuongthuc.component.css']
})
export class QlphuongthucComponent {
  ListPhuongThuc: PhuongThuc[] = [];
  
  ten: string = '';
  moTa: string = '';
  trangThai = 1;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private phuongThucService: PhuongThucService){}

  ngOnInit(){
    this.getall(this.p);
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      ten: this.searchTerm
    };
    this.phuongThucService.getall(obj).subscribe(res => {
      this.ListPhuongThuc = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.ten = '';
    this.moTa = '';
    this.trangThai = 1;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.ten) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const phuongthuc: any = {
      ten: this.ten,
      moTa: this.moTa,
      trangThai: this.trangThai ? 1 : 0,
    }
  
    this.phuongThucService.create(phuongthuc).subscribe(res => {
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
      if (!this.ten) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const phuongthuc: any = {
        id: this.selectedRow.id,
        ten: this.ten,
        moTa: this.moTa,
        trangThai: this.trangThai ? 1 : 0,
      };
      // Gọi phương thức sửa từ service
      this.phuongThucService.update(phuongthuc).subscribe(res => {
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
      this.phuongThucService.detele(id).subscribe(
        res => {
          // Xử lý khi xóa thành công
          this.getall(this.p);
          swal.fire({
            icon: 'success',
            title: res.message,
            showConfirmButton: true,
            timer: 1500
          });
          this.closeModal(this.deleteModal);
        },
        error => {
          swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: "Không thể xoá phương thức này", 
            showConfirmButton: true
          });
          this.closeModal(this.deleteModal);
        }
      );
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
  selectedRow: PhuongThuc | null = null;

  onRowClick(phuongThuc: PhuongThuc) {
    this.selectedRow = phuongThuc;

    this.ten = this.selectedRow.ten;
    this.moTa = this.selectedRow.moTa;
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
