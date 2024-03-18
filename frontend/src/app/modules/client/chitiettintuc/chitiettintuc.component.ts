import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SanPham } from 'src/app/models/sanpham.model';
import { TinTuc } from 'src/app/models/tintuc.model';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { TinTucService } from 'src/app/service/tintuc.service';

@Component({
  selector: 'app-chitiettintuc',
  templateUrl: './chitiettintuc.component.html',
  styleUrls: ['./chitiettintuc.component.css']
})
export class ChitiettintucComponent {
  ListSanPhamNgauNhien: SanPham[] = [];
  ListTinTucNgauNhien: TinTuc[] = [];

  tintuc: TinTuc = new TinTuc();

  constructor(
    private _route: ActivatedRoute,
    private sanPhamService: SanPhamService,
    private tinTucService: TinTucService
  ) {}

  ngOnInit(){
    this.getsanphamngaunhien();
    this.gettintucngaunhien();
    this.getbyid();
  }

  //Lấy tin tức theo id
  getbyid(){
    this._route.params.subscribe(params => {
      const id = params['id'];
      this.tinTucService.getbyid(id).subscribe(res => {
        this.tintuc = res.data;
      });
    });
  }

  //Lấy sản phẩm ngẫu nhiên
  getsanphamngaunhien() {
    this.sanPhamService.getsanphamngaunhien(3).subscribe(res => {
      this.ListSanPhamNgauNhien = res.data;
    });
  }

  //Lấy tin tức ngẫu nhiên
  gettintucngaunhien() {
    this.tinTucService.gettintucngaunhien(6).subscribe(res => {
      this.ListTinTucNgauNhien = res.data;
    });
  }
}