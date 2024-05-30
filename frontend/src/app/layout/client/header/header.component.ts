import { Component, OnInit, OnDestroy } from '@angular/core';
import { Menu } from 'src/app/models/menu.model';
import { LoaiSanPham } from 'src/app/models/loaisanpham.model';
import { LoaiSanPhamService } from 'src/app/service/loaisanpham.service';
import { MenuService } from 'src/app/service/menu.service';
import { Router, NavigationEnd } from '@angular/router';
import { CartService } from 'src/app/service/cart.service';
import { AuthService } from 'src/app/service/auth.service';
import { Subscription } from 'rxjs';
import { ThamsoService } from 'src/app/service/thamso.service';
import { ThamSo } from 'src/app/models/thamso.model';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  ListMenu: Menu[] = [];
  ListDanhMuc: LoaiSanPham[] = [];

  logo: ThamSo = new ThamSo();
  email: ThamSo = new ThamSo();
  sdt: ThamSo = new ThamSo();
  time: ThamSo = new ThamSo();
  shipping: ThamSo = new ThamSo();
  refund: ThamSo = new ThamSo();

  SoLuong: number = 0;
  TongGia: number = 0;
  user: any;

  timkiem: string = '';
  isHomePage: boolean = true;

  routerSubscription: Subscription;

  constructor(
    private _router: Router,
    private loaiSanPhamService: LoaiSanPhamService, 
    private menuService: MenuService,
    private cartService: CartService,
    private authService: AuthService,
    private thamsoService: ThamsoService,
  ) {
    // Subscribe to router events
    this.routerSubscription = this._router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.isHomePage = event.url === '/';
        this.loadUser();
      }
    });
  }

  ngOnInit() {
    this.getallmenu();
    this.getalldanhmuc();
    this.loadGioHang();
    this.loadUser();
    this.loadThamSo();
    
    this.cartService.cartUpdated.subscribe(() => {
      this.loadGioHang();
    });
  }

  // Load người dùng
  loadUser() {
    this.user = this.authService.loadUser();
  }  

  //Đăng xuất
  deleteUser() {
    this.authService.logout();
  }   

  //Tìm kiếm
  search() {
    this._router.navigate(['/timkiem'], { queryParams: { 'ten': this.timkiem } });
  }

  // Handle keyup event on the search input
  onKeyUp(event: KeyboardEvent) {
    if (event.key === 'Enter') {
      this.search();
    }
  }

  //Lấy toàn bộ danh mục
  getalldanhmuc() {
    this.loaiSanPhamService.get().subscribe(res => {
      this.ListDanhMuc = res.data;
    });
  }

  //Lấy toàn bộ menu
  getallmenu() {
    this.menuService.get().subscribe(res => {
      this.ListMenu = res.data;
    });
  }

  // Load giỏ hàng header
  loadGioHang() {
    var cart = this.cartService.loadGioHang();
    this.SoLuong = cart.SoLuong;
    this.TongGia = cart.TongGia;
  }

  //Tham số
  loadThamSo() {
    this.thamsoService.getbyma("LOGO").subscribe(res => {
      this.logo = res.data;
    });
    this.thamsoService.getbyma("EMAIL").subscribe(res => {
      this.email = res.data;
    });
    this.thamsoService.getbyma("NUMBER").subscribe(res => {
      this.sdt = res.data;
    });
    this.thamsoService.getbyma("TIME").subscribe(res => {
      this.time = res.data;
    });
    this.thamsoService.getbyma("SHIPPING").subscribe(res => {
      this.shipping = res.data;
    });
    this.thamsoService.getbyma("REFUND").subscribe(res => {
      this.refund = res.data;
    });
  }  
}