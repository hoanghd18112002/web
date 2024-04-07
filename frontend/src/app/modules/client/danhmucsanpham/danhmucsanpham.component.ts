import { Component } from '@angular/core';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { LoaiSanPham } from 'src/app/models/loaisanpham.model';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { CartService } from 'src/app/service/cart.service';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { SanPhamService } from 'src/app/service/sanpham.service';

@Component({
  selector: 'app-danhmucsanpham',
  templateUrl: './danhmucsanpham.component.html',
  styleUrls: ['./danhmucsanpham.component.css']
})
export class DanhmucsanphamComponent {
  ListDanhMuc: LoaiSanPham[] = [];
  ListNhaSanXuat: NhaSanXuat[] = [];
  ListSanPham: SanPham[] = [];
  
  SoLuongSanPham: number = 0;
  p: number = 1;
  pageSize: number = 12;
  totalItems: number = 0;
  
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

  //Lấy sản phẩm theo loại sản phẩm
  getsanphambyloai(p: number){
    this._route.params.subscribe(params => {
      const id = params['id'];
      const SanPham = {
        page: p,
        pageSize: this.pageSize,
        id: null,
        ten: null,
        tenNhaSanXuat: '',
        tenLoai: '',
        minGia: null,
        maxGia: null,
        idNhaSanXuat: null,
        idLoai: id,
      };
      this.sanPhamService.search(SanPham).subscribe(res => {
        this.ListSanPham = res.data;
        this.totalItems = res.totalItems;
        this.p = p;
      });
    });
  }

  //Thêm vào giỏ hàng
  addToCart(id: number) {
    this.cartService.addToCart(id, 1);
  }

  //Tìm kiếm theo khoảng giá
  searchGia(minGia: any, maxGia: any) {
    if(minGia == 0){minGia = null}
    if(maxGia == 0){maxGia = null}
    this._router.navigate(['/timkiem'], { queryParams: { 'minGia': minGia, 'maxGia': maxGia } });
  }

  //Tìm kiếm theo nhà sản xuất
  searchNhaSanXuat(idNhaSanXuat: number) {
    this._router.navigate(['/timkiem'], { queryParams: { 'idNhaSanXuat': idNhaSanXuat } });
  }

  //Lấy toàn bộ danh mục có số lượng
  getalldanhmuc() {
    this.loaiSanPhamService.get().subscribe(res => {
      this.ListDanhMuc = res.data;
    });
  }

  //Lấy toàn bộ nhà sản xuất có số lượng
  getallnhasanxuat() {
    this.nhaSanXuatService.get().subscribe(res => {
      this.ListNhaSanXuat = res.data;
    });
  }
}
