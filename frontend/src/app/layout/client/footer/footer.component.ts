import { Component } from '@angular/core';
import { ThamSo } from 'src/app/models/thamso.model';
import { ThamsoService } from 'src/app/service/thamso.service';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent {
  banquyen: ThamSo = new ThamSo();
  email: ThamSo = new ThamSo();
  diaChi: ThamSo = new ThamSo();
  sdt: ThamSo = new ThamSo();
  payment: ThamSo = new ThamSo();

  constructor(private thamsoService: ThamsoService) {}

  ngOnInit() {
    this.loadThamSo();
  }

  //Tham số
  loadThamSo() {
    this.thamsoService.getbyma("COPYRIGHT").subscribe(res => {
      this.banquyen = res.data;
    });
    this.thamsoService.getbyma("EMAIL").subscribe(res => {
      this.email = res.data;
    });
    this.thamsoService.getbyma("ADRESS").subscribe(res => {
      this.diaChi = res.data;
    });
    this.thamsoService.getbyma("NUMBER").subscribe(res => {
      this.sdt = res.data;
    });
    this.thamsoService.getbyma("PAYMENT").subscribe(res => {
      this.payment = res.data;
    });
  }  
}
