import { Component, OnInit  } from '@angular/core';
import { SanPham } from 'src/app/models/sanpham.model';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { NhaSanXuatService } from 'src/app/service/nhasanxuat.service';
import { SanPhamService } from 'src/app/service/sanpham.service';

import { ActivatedRoute, Router } from '@angular/router';
import { ThongSo } from 'src/app/models/thongso.model';
import { CartService } from 'src/app/service/cart.service';
import { ThongSoService } from 'src/app/service/thongso.service';
import swal from 'sweetalert2';

@Component({
  selector: 'app-chitietsanpham',
  templateUrl: './chitietsanpham.component.html',
  styleUrls: ['./chitietsanpham.component.css']
})
export class ChitietsanphamComponent implements OnInit {
  ListSanPhamNgauNhien: SanPham[] = [];
  ListLoaiSanPham: SanPham[] = [];
  ListSanPhamTuongTu: SanPham[] = [];
  ListNhaSanXuat: SanPham[] = [];
  ListThongSo: ThongSo[] = [];
  
  IdLoai: any;
  SoLuongMua: number = 1;
  id: any;
  sanpham: SanPham = new SanPham();

  constructor(
    private _router: Router,
    private _route: ActivatedRoute,
    private sanPhamService: SanPhamService, 
    private loaiSanPhamService: LoaiSanPhamService, 
    private nhaSanXuatService: NhaSanXuatService,
    private cartService: CartService,
    private thongSoService: ThongSoService
  ) {}

  ngOnInit(){
    this.getbyid();
    this.getsanphamngaunhien();
    this.getloaisanpham();
    this.getnhasanxuat();
    this.getbysanpham();
  }

  //Thêm vào giỏ hàng
  addToCart(id: number, soluong: number) {
    this.cartService.addToCart(id, soluong);
  }
  
  //Lấy sản phẩm theo id
  getbyid() {
    this._route.params.subscribe(params => {
      this.id = params['id'];
      this.sanPhamService.getbyid(this.id).subscribe(res => {
        this.sanpham = res.data;
        this.getsanphamtuongtu()
      });
    });
  }
  
  //Lấy sản phẩm sản phẩm tương tự
  getsanphamtuongtu() {
    const SanPham = {
      page: 1,
      pageSize: 8,
      id: null,
      ten: null,
      tenNhaSanXuat: '',
      tenLoai: '',
      minGia: null,
      maxGia: null,
      idNhaSanXuat: null,
      idLoai: this.sanpham.idLoai,
    };
    this.sanPhamService.search(SanPham).subscribe(res => {
      this.ListSanPhamTuongTu = res.data.filter((item: any) => item.ID !== this.sanpham.id).slice(0, 8);
    });    
  }

  //Lấy thông số theo sản phẩm
  getbysanpham() {
    this._route.params.subscribe((params) => {
      var id = params['id'];
      this.thongSoService.getbysanpham(id).subscribe(res => {
        this.ListThongSo = res.data;
      });
    });
  }

  //Tìm kiếm theo nhà sản xuất
  searchNhaSanXuat(idNhaSanXuat: number) {
    this._router.navigate(['/timkiem'], { queryParams: { 'idNhaSanXuat': idNhaSanXuat } });
  }

  //Lấy sản phẩm ngẫu nhiên
  getsanphamngaunhien() {
    this.sanPhamService.getsanphamngaunhien(8).subscribe(res => {
      this.ListSanPhamNgauNhien = res.data;
    });
  }

  //Lấy loại sản phẩm
  getloaisanpham() {
    this.loaiSanPhamService.get().subscribe(res => {
      this.ListLoaiSanPham = res.data;
    });
  }

  //Lấy nhà sản xuất
  getnhasanxuat() {
    this.nhaSanXuatService.get().subscribe(res => {
      this.ListNhaSanXuat = res.data;
    });
  }

  reloadPage(id: number) {
    this._router.navigateByUrl('/', { skipLocationChange: true }).then(() => {
      this._router.navigate(['/chitietsanpham', id]);
    });
  }
}
