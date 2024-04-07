import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';
import { LoaiSanPham } from 'src/app/models/loaisanpham.model';
import { NhaSanXuat } from 'src/app/models/nhasanxuat.model';
import { SanPham } from 'src/app/models/sanpham.model';
import { CartService } from 'src/app/service/cart.service';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { SanPhamService } from 'src/app/service/sanpham.service';

@Component({
  selector: 'app-timkiem',
  templateUrl: './timkiem.component.html',
  styleUrls: ['./timkiem.component.css']
})
export class TimkiemComponent {
  ListSanPham: SanPham[] = [];
  ListDanhMuc: LoaiSanPham[] = [];
  ListNhaSanXuat: NhaSanXuat[] = [];

  ten: any = '';
  IDLoai: any = "";
  IDNhaSanXuat: any = "";
  MinGia: any = ""; 
  MaxGia: any = "";
  
  p: number = 1;
  pageSize: number = 12;
  totalItems: number = 0;
  
  constructor(
    private _route: ActivatedRoute,
    private sanPhamService: SanPhamService,
    private loaiSanPhamService: LoaiSanPhamService, 
    private nhaSanXuatService: NhaSanXuatService,
    private cartService: CartService,
    private _router: Router,
  ) {}

  ngOnInit(){
    this.getalldanhmuc();
    this.getallnhasanxuat();
    this.getsanphamsearch(this.p);
  }

  //Sự kiện tìm kiếm
  search() {
    this._router.navigate(['/timkiem'], { 
      queryParams: { 
        'idLoai': this.IDLoai, 
        'idNhaSanXuat': this.IDNhaSanXuat,
        'minGia': this.MinGia,
        'maxGia': this.MaxGia,
      } 
    });
  }  

  //Lấy sản phẩm tìm kiếm
  getsanphamsearch(p: number) {
    this._route.queryParams.subscribe(params => {
      this.ten = params['ten'];
      this.IDLoai = params['idLoai'];
      this.IDNhaSanXuat = params['idNhaSanXuat'];
      this.MinGia = params['minGia'];
      this.MaxGia = params['maxGia'];
      
      const SanPham = {
        page: p,
        pageSize: this.pageSize,
        id: null,
        ten: this.ten,
        tenNhaSanXuat: '',
        tenLoai: '',
        minGia: this.MinGia,
        maxGia: this.MaxGia,
        idNhaSanXuat: this.IDNhaSanXuat,
        idLoai: this.IDLoai,
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
