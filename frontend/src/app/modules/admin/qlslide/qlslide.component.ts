import { Component, ElementRef, ViewChild  } from '@angular/core';
import { Slide } from 'src/app/models/slide.model';
import { SlideService } from 'src/app/service/slide.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlslide',
  templateUrl: './qlslide.component.html',
  styleUrls: ['./qlslide.component.css']
})
export class QlslideComponent {
  ListSlide: Slide[] = [];
  ListSlideCha: Slide[] = [];
  
  tieuDe: any = '';
  noiDung: any = '';
  anh: any = null;
  kieu: any = '';
  trangThai = 1;
  idCha: any = 0;
  tenSlideCha: any = "";

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private slideService: SlideService){}

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
      tieuDe: this.searchTerm
    };
    this.slideService.getall(obj).subscribe(res => {
      this.ListSlide = res.data;
      this.totalItems = res.totalItems;
      this.p = p
    });
    this.slideService.get().subscribe(res => {
      this.ListSlideCha = res.data.filter((item:any) => item.kieu === 0 && item.idCha === 0);
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.tieuDe = '';
    this.noiDung = '';
    this.anh = null;
    this.kieu = '';
    this.trangThai = 1;
    this.idCha = 0;

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.anh) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const formData = new FormData();
    formData.append('tieuDe', this.tieuDe);
    formData.append('noiDung', this.noiDung);
    formData.append('file', this.anh!);
    formData.append('kieu', this.kieu);
    formData.append('trangThai', this.trangThai ? '1' : '0');
    formData.append('idCha', this.idCha);

    this.slideService.create(formData).subscribe(res => {
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
      const formData = new FormData();
      formData.append('id', String(this.selectedRow.id));
      formData.append('tieuDe', this.tieuDe);
      formData.append('noiDung', this.noiDung);
      formData.append('file', this.anh!);
      formData.append('kieu', this.kieu);
      formData.append('trangThai', this.trangThai ? '1' : '0');
      formData.append('idCha', this.idCha);
      
      // Gọi phương thức sửa từ service
      this.slideService.update(formData).subscribe(res => {
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
      this.slideService.detele(id).subscribe(
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
            text: "Không thể xoá slide này", 
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
  selectedRow: Slide | null = null;

  onRowClick(slide: Slide) {
    this.selectedRow = slide;

    this.tieuDe = this.selectedRow.tieuDe;
    this.noiDung = this.selectedRow.noiDung;
    this.anh = this.selectedRow.anh;
    this.kieu = this.selectedRow.kieu;
    this.trangThai = this.selectedRow.trangThai;
    this.idCha = this.selectedRow.idCha;
    this.tenSlideCha = this.selectedRow.tenSlideCha;
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
