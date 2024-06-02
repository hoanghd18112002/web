import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SanPham } from 'src/app/models/sanpham.model';
import { TinTuc } from 'src/app/models/tintuc.model';
import { SanPhamService } from 'src/app/service/sanpham.service';
import { TinTucService } from 'src/app/service/tintuc.service';
import swal from 'sweetalert2';

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
    private _router: Router,
    private sanPhamService: SanPhamService,
    private tinTucService: TinTucService,
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
        if (res.data == null || res.data.trangThai === 0) {
          swal.fire({
              icon: 'error',
              title: 'Tin tức không khả dụng',
              showConfirmButton: true,
              timer: 1500
          }).then(()=>{ this._router.navigate(['/']); });
        } else {
          this.tintuc = res.data;
        }
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

  reloadPage(id: number) {
    this._router.navigateByUrl('/', { skipLocationChange: true }).then(() => {
      this._router.navigate(['/chitiettintuc', id]);
    });
  }
}
