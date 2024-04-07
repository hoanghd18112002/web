import { Component, ElementRef, ViewChild  } from '@angular/core';
import { LienHe } from 'src/app/models/lienhe.model';
import { LienHeService } from 'src/app/service/lienhe.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qllienhe',
  templateUrl: './qllienhe.component.html',
  styleUrls: ['./qllienhe.component.css']
})
export class QllienheComponent {
  ListLienHe: LienHe[] = [];

  noiDung: string = '';
  trangThai = 1;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private lienHeService: LienHeService) {}

  ngOnInit() {
    this.getall(this.p);
  }

  getall(p: number) {
    const obj = {
      page: p,
      pageSize: this.pageSize,
      noiDung: this.searchTerm,
    };
    this.lienHeService.getall(obj).subscribe(res => {
      this.ListLienHe = res.data;
      this.totalItems = res.totalItems;
      this.p = p
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.noiDung = '';
    this.trangThai = 1;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.noiDung) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const lienhe: any = {
      noiDung: this.noiDung,
      trangThai: this.trangThai ? 1 : 0,
    }
  
    this.lienHeService.create(lienhe).subscribe(res => {
      this.getall(this.p);
      swal.fire({
        icon: 'success',
        title: res.message,
        showConfirmButton: true,
        timer: 1500
      });
  
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
      if (!this.noiDung) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const lienhe: any = {
        id: this.selectedRow.id,
        noiDung: this.noiDung,
        trangThai: this.trangThai ? 1 : 0,
      };
      // Gọi phương thức sửa từ service
      this.lienHeService.update(lienhe).subscribe(res => {
        this.getall(this.p);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });
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
      this.lienHeService.detele(id).subscribe(res => {
        this.getall(this.p);
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });
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
  selectedRow: LienHe | null = null;

  onRowClick(lienHe: LienHe) {
    this.selectedRow = lienHe;

    this.noiDung = this.selectedRow.noiDung;
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
