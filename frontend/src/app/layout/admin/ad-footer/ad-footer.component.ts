import { Component } from '@angular/core';
import { ThamSo } from 'src/app/models/thamso.model';
import { ThamsoService } from 'src/app/service/thamso.service';

@Component({
  selector: 'app-ad-footer',
  templateUrl: './ad-footer.component.html',
  styleUrls: ['./ad-footer.component.css']
})
export class AdFooterComponent {
  banquyen: ThamSo = new ThamSo();

  constructor(private thamsoService: ThamsoService) {}

  ngOnInit() {
    this.loadThamSo();
  }

  //Tham số
  loadThamSo() {
    this.thamsoService.getbyma("COPYRIGHT").subscribe(res => {
      this.banquyen = res.data;
    });
  }  
}
