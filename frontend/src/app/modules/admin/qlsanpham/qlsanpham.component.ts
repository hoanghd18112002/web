import { Component, ElementRef, ViewChild  } from '@angular/core';
import { LoaiSanPham } from 'src/app/models/loaisanpham.model';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { ThongSo } from 'src/app/models/thongso.model';
import { GiaSanPhamService } from 'src/app/service/giasanpham.service';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { ThongSoService } from 'src/app/service/thongso.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-qlsanpham',
  templateUrl: './qlsanpham.component.html',
  styleUrls: ['./qlsanpham.component.css']
})
export class QlsanphamComponent {
  ListSanPham: SanPham[] = [];
  ListNhaSanXuat: NhaSanXuat[] = [];
  ListLoai: LoaiSanPham[] = [];
  
  ten: string = '';
  moTa: string = '';
  anh: any = null;
  ngayTao: Date = new Date();
  trangThai = 1;
  idNhaSanXuat: any;
  idLoai: any;
  tenNhaSanXuat: string = '';
  tenLoai: string = '';
  soLuong: number = 0;

  gia: any;
  ngayBatDau: string = '';
  ngayKetThuc: string = '';
  idSanPham: any;

  searchTerm: string = ''; 
  p: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  totalPages: number = 0;
  totalPagesArray: number[] = [];
  visiblePages: number[] = [];

  newThongSo: { ten: string, moTa: string} = { ten: '', moTa: ''};
  thongSo: { ten: string, moTa: string}[] = [];

  @ViewChild('addModal') addModal!: ElementRef;
  @ViewChild('updateModal') updateModal!: ElementRef;
  @ViewChild('deleteModal') deleteModal!: ElementRef;

  constructor(
    private sanPhamService: SanPhamService,
    private nhaSanXuatService: NhaSanXuatService,
    private loaiSanPhamService: LoaiSanPhamService,
    private giaSanPhamService: GiaSanPhamService,
    private thongSoService: ThongSoService
  ){}

  ngOnInit(){
    this.getall();
    this.getNhaSanXuat();
    this.getLoai();
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
    this.sanPhamService.getall(obj).subscribe(res => {
      this.ListSanPham = res.data;
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

  //Lấy danh sách
  getNhaSanXuat(){
    this.nhaSanXuatService.get().subscribe(res => {
      this.ListNhaSanXuat = res.data;
    });
  }

  //Lấy danh sách
  getLoai(){
    this.loaiSanPhamService.get().subscribe(res => {
      this.ListLoai = res.data;
    });
  }

  //Tạo mới xoá nội dung form
  loadForm(){
    this.ten = '';
    this.moTa = '';
    this.anh = null;
    this.trangThai = 1;
    this.idNhaSanXuat = '';
    this.idLoai = '';

    this.gia = 0;
    this.ngayBatDau = '';
    this.ngayKetThuc = '';
    this.idSanPham = 0;
    
    this.thongSo.splice(0, this.thongSo.length);

    this.selectedRow = null;
  }

  //Thêm
  add() {
    if (!this.ten || !this.anh || !this.idNhaSanXuat || !this.idLoai || !this.gia || !this.ngayBatDau || !this.ngayKetThuc) {
      alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
      return;
    }

    const formData = new FormData();
    formData.append('ten', this.ten);
    formData.append('moTa', this.moTa);
    formData.append('file', this.anh!);
    formData.append('trangThai', this.trangThai ? '1' : '0');
    formData.append('idNhaSanXuat', this.idNhaSanXuat);
    formData.append('idLoai', this.idLoai);

    this.sanPhamService.create(formData).subscribe(res => {
      this.sanPhamService.getnew().subscribe(res => {
        const giasanpham: any = {
          gia: this.gia,
          ngayBatDau: this.ngayBatDau,
          ngayKetThuc: this.ngayKetThuc,
          idSanPham: res.data.id,
        }
        this.giaSanPhamService.create(giasanpham).subscribe(res => {this.getall();});

        for (let i = 0; i < this.thongSo.length; i++) {
          const thongso: any = {
            ten: this.thongSo[i].ten,
            moTa: this.thongSo[i].moTa,
            idSanPham: res.data.id,
          }
          this.thongSoService.create(thongso).subscribe(res => {this.getall();});
        }
      });

      this.getall();
      swal.fire({
        icon: 'success',
        title: res.message,
        showConfirmButton: true,
        timer: 1500
      });(res.message);
      this.selectedRow = null;

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

  //Thêm thông số 
  addThongSo() {
    if (this.newThongSo.ten && this.newThongSo.moTa) {
      this.thongSo.push({ ...this.newThongSo });
      this.newThongSo = { ten: '', moTa: ''};
    } else {
      alert('Thông tin thông số không được để trống');
    }
  }

  //Xoá thông số trong thêm sản phẩm
  deleteThongSo(index: number): void {
    this.thongSo.splice(index, 1);
  }

  //Sửa
  update() {
    if (this.selectedRow) {
      if (!this.ten || !this.idNhaSanXuat || !this.idLoai) {
        alert('Vui lòng điền đầy đủ thông tin có dấu đỏ');
        return;
      }

      const formData = new FormData();

      formData.append('id', String(this.selectedRow.id));
      formData.append('ten', this.ten);
      formData.append('moTa', this.moTa);
      formData.append('file', this.anh!);
      formData.append('trangThai', this.trangThai ? '1' : '0');
      formData.append('idNhaSanXuat', this.idNhaSanXuat);
      formData.append('idLoai', this.idLoai);
      
      const id = this.selectedRow.id;
      var gia = this.gia;

      // Gọi phương thức sửa từ service
      this.sanPhamService.update(formData).subscribe(res => {
        this.giaSanPhamService.getbysanpham(id).subscribe(res1 => {
          const giasanpham: any = {
            id: res1.data[0].id,
            gia: gia,
            ngayBatDau: this.ngayBatDau,
            ngayKetThuc: this.ngayKetThuc,
          }
          this.giaSanPhamService.update(giasanpham).subscribe(res => {this.getall();});

        });
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

  // Thêm thông số trong sửa sản phẩm
  createThongSoUpdate(): void {
    if (confirm('Bạn có muốn thêm thông số mới không?')) {
      const ThongSo: any = {
        ten: this.newThongSo.ten,
        moTa: this.newThongSo.moTa,
        idSanPham: this.idSanPham,
      };
      this.thongSoService.create(ThongSo).subscribe(res => {
        this.loadThongSo();
        this.newThongSo.moTa = '';
        this.newThongSo.ten = '';
      });
    }
  }

  // Xoá thông số trong sửa sản phẩm
  deleteThongSoUpdate(thongSo: any): void {
    if (confirm('Bạn có muốn xoá thông số này không?')) {
      this.thongSoService.detele(thongSo.ID).subscribe(res => {this.loadThongSo();});
    }
  }


  //Xoá
  delete() {
    if (this.selectedRow) {
      const id = this.selectedRow.id; // Lấy id để xoá
      // Gọi phương thức xoá từ service
      this.sanPhamService.detele(id).subscribe(res => {
        this.getall();
        swal.fire({
          icon: 'success',
          title: res.message,
          showConfirmButton: true,
          timer: 1500
        });(res.message);
    
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
  selectedRow: SanPham | null = null;

  onRowClick(sanPham: SanPham) {
    this.selectedRow = sanPham;

    this.idSanPham = this.selectedRow.id;
    this.ten = this.selectedRow.ten;
    this.moTa = this.selectedRow.moTa;
    this.anh = this.selectedRow.anh;
    this.ngayTao = this.selectedRow.ngayTao;
    this.trangThai = this.selectedRow.trangThai;
    this.idNhaSanXuat = this.selectedRow.idNhaSanXuat;
    this.idLoai = this.selectedRow.idLoai;
    this.gia = this.selectedRow.gia;
    this.tenNhaSanXuat = this.selectedRow.tenNhaSanXuat;
    this.tenLoai = this.selectedRow.tenLoai;
    this.soLuong = this.selectedRow.soLuong;

    this.giaSanPhamService.getbysanpham(this.selectedRow.id).subscribe(res => {
      this.gia = res.data[0].gia;
      this.ngayBatDau = this.formatDate(res.data[0].ngayBatDau);
      this.ngayKetThuc = this.formatDate(res.data[0].ngayKetThuc);
    });

    this.loadThongSo();
  }

  loadThongSo(){
    this.thongSoService.getbysanpham(this.idSanPham).subscribe(res => {
      this.thongSo = res.data;
    });
  }
  
  formatDate(date: string): string {
    const originalDate = new Date(date);
    originalDate.setDate(originalDate.getDate() + 1);
    const formattedDate = originalDate.toISOString().slice(0, 10);
    return formattedDate;
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
