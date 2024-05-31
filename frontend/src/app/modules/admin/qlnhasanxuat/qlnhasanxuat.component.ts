import { Component, ElementRef, ViewChild  } from '@angular/core';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlnhasanxuat',
  templateUrl: './qlnhasanxuat.component.html',
  styleUrls: ['./qlnhasanxuat.component.css']
})
export class QlnhasanxuatComponent {
  ListNhaSanXuat: NhaSanXuat[] = [];
  
  ten: string = '';
  anh: any = null;
  moTa: string = '';
  trangThai = 1;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private nhaSanXuatService: NhaSanXuatService){}

  ngOnInit(){
    this.getall(this.p);
  }

  //File
  onFileChange(event: any) {
    const fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.anh = fileList[0];
    }
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      ten: this.searchTerm
    };
    this.nhaSanXuatService.getall(obj).subscribe(res => {
      this.ListNhaSanXuat = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.ten = '';
    this.anh = null;
    this.moTa = '';
    this.trangThai = 1;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.ten || !this.anh) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const formData = new FormData();
    formData.append('ten', this.ten);
    formData.append('file', this.anh!);
    formData.append('moTa', this.moTa);
    formData.append('trangThai', this.trangThai ? '1' : '0');

    this.nhaSanXuatService.create(formData).subscribe(res => {
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
      
      const formData = new FormData();
      formData.append('id', String(this.selectedRow.id));
      formData.append('ten', this.ten);
      formData.append('file', this.anh!);
      formData.append('moTa', this.moTa);
      formData.append('trangThai', this.trangThai ? '1' : '0');
      
      // Gọi phương thức sửa từ service
      this.nhaSanXuatService.update(formData).subscribe(res => {
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
      this.nhaSanXuatService.detele(id).subscribe(
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
            text: "Không thể xoá nhà sản xuất này", 
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
  selectedRow: NhaSanXuat | null = null;

  onRowClick(nhaSanXuat: NhaSanXuat) {
    this.selectedRow = nhaSanXuat;

    this.ten = this.selectedRow.ten;
    this.anh = this.selectedRow.anh;
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
