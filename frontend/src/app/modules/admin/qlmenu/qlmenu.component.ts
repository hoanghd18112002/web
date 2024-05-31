import { Component, ElementRef, ViewChild  } from '@angular/core';
import { Menu } from 'src/app/models/menu.model';
import { MenuService } from 'src/app/service/menu.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlmenu',
  templateUrl: './qlmenu.component.html',
  styleUrls: ['./qlmenu.component.css']
})
export class QlmenuComponent {
  ListMenu: Menu[] = [];
  ListMenuCha: Menu[] = [];

  ten: string = '';
  link: string = '';
  trangThai = 1;
  idCha: any = '';
  tenMenuCha: string = '';

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(private menuService: MenuService){}

  ngOnInit(){
    this.getall(this.p);
  }

  //Lấy danh sách toàn bộ
  getall(p: number){
    const obj = {
      page: p,
      pageSize: this.pageSize,
      ten: this.searchTerm,
    };
    this.menuService.getall(obj).subscribe(res => {
      this.ListMenu = res.data;
      this.totalItems = res.totalItems;
      this.p = p;
    });
    this.menuService.get().subscribe(res => {
      this.ListMenuCha = res.data.filter((item:any) => item.idCha === 0);
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.ten = '';
    this.link = '';
    this.trangThai = 1;
    this.idCha = '';

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.ten || !this.link) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const menu: any = {
      ten: this.ten,
      link: this.link,
      trangThai: this.trangThai ? 1 : 0,
      idCha: Number(this.idCha),
    }

    this.menuService.create(menu).subscribe(res => {
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
      if (!this.ten || !this.link) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }
      
      // Tạo một đối tượng từ dữ liệu được chọn
      const menu: any = {
        id: this.selectedRow.id,
        ten: this.ten,
        link: this.link,
        trangThai: this.trangThai ? 1 : 0,
        idCha: Number(this.idCha),
      };
      
      // Gọi phương thức sửa từ service
      this.menuService.update(menu).subscribe(res => {
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
      this.menuService.detele(id).subscribe(
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
            text: "Không thể xoá menu này", 
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
  selectedRow: Menu | null = null;

  onRowClick(menu: Menu) {
    this.selectedRow = menu;
    
    this.ten = this.selectedRow.ten;
    this.link = this.selectedRow.link;
    this.trangThai = this.selectedRow.trangThai;
    this.idCha = this.selectedRow.idCha;
    this.tenMenuCha = this.selectedRow.tenMenuCha;
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
