import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LoaiSanPham } from 'src/app/models/loaisanpham.model';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { CartService } from 'src/app/service/cart.service';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { SanPhamService } from 'src/app/service/sanpham.service';
import swal from 'sweetalert2';
@Component({
  selector: 'app-danhmucsanpham',
  templateUrl: './danhmucsanpham.component.html',
  styleUrls: ['./danhmucsanpham.component.css']
})
export class DanhmucsanphamComponent {
  ListDanhMuc: LoaiSanPham[] = [];
  ListNhaSanXuat: NhaSanXuat[] = [];
  ListSanPham: SanPham[] = [];
  
  KieuSapXep: string = 'ngaytao';
  
  SoLuongSanPham: number = 0;
  p: number = 1;
  pageSize: number = 12;
  totalItems: number = 0;

  // Chuyển tag
  viewMode: 'grid' | 'list' = 'grid';

  constructor(
    private _router: Router,
    private _route: ActivatedRoute, 
    private loaiSanPhamService: LoaiSanPhamService, 
    private nhaSanXuatService: NhaSanXuatService,
    private sanPhamService: SanPhamService,
    private cartService: CartService
  ) {}

  ngOnInit(){
    this.getalldanhmuc();
    this.getallnhasanxuat();
    this.getsanphambyloai(this.p);
  }

  setView(view: 'grid' | 'list') {
    this.viewMode = view;
  }

  getsanphambyloai(p: number){
    this._route.params.subscribe(params => {
      const id = params['id'];
      const SanPham = {
        page: p,
        pageSize: this.pageSize,
        idLoai: id,
        kieuSapXep: this.KieuSapXep
      };
      this.loaiSanPhamService.getbyid(id).subscribe(res => {
        if (res.data == null || res.data.trangThai === 0) {
          swal.fire({
              icon: 'error',
              title: 'Loại sản phẩm không khả dụng',
              showConfirmButton: true,
              timer: 1500
          }).then(()=>{ this._router.navigate(['/']); });
        } else {
          this.sanPhamService.search(SanPham).subscribe(res => {
            this.ListSanPham = res.data;
            this.totalItems = res.totalItems;
            this.p = p;
          });
        }
      });
    });
  }

  addToCart(id: number) {
    this.cartService.addToCart(id, 1);
  }

  searchGia(minGia: any, maxGia: any) {
    if(minGia == 0){minGia = null}
    if(maxGia == 0){maxGia = null}
    this._router.navigate(['/timkiem'], { queryParams: { 'minGia': minGia, 'maxGia': maxGia } });
  }

  searchNhaSanXuat(idNhaSanXuat: number) {
    this._router.navigate(['/timkiem'], { queryParams: { 'idNhaSanXuat': idNhaSanXuat } });
  }

  getalldanhmuc() {
    this.loaiSanPhamService.get().subscribe(res => {
      this.ListDanhMuc = res.data;
    });
  }

  getallnhasanxuat() {
    this.nhaSanXuatService.get().subscribe(res => {
      this.ListNhaSanXuat = res.data;
    });
  }
}
