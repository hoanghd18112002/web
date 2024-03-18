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
  
  ten: string = '';
  link: string = '';
  trangThai = 1;
  idCha: any = '';
  tenMenuCha: string = '';

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

  constructor(private menuService: MenuService){}

  ngOnInit(){
    this.getall();
  }

  //Lấy danh sách toàn bộ
  getall(){
    const obj = {
      page: this.p,
      pageSize: this.pageSize,
      ten: this.searchTerm,
    };
    this.menuService.getall(obj).subscribe(res => {
      this.ListMenu = res.data;
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
      this.menuService.detele(id).subscribe(res => {
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
