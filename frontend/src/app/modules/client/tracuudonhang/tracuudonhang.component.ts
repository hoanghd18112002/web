import { Params, Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { DonHangService } from 'src/app/service/donhang.service';

@Component({
  selector: 'app-tracuudonhang',
  templateUrl: './tracuudonhang.component.html',
  styleUrls: ['./tracuudonhang.component.css']
})
export class TracuudonhangComponent implements OnInit {
  id: any;
  donhang: any;
  ctdonhang: any;

  constructor(private route: ActivatedRoute, private router: Router, private donHangService: DonHangService) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      this.id = params['id'];
      if (this.id) {
        this.tracuu();
      }
    });
  }

  tracuu() {
    this.donHangService.getbyid(this.id).subscribe(res => {
      this.donhang = res.data;
      this.donHangService.getbydonhang(this.id).subscribe(res => {
        this.ctdonhang = res.data;
      });
    });
    // Thêm ID vào URL
    this.router.navigate([], { relativeTo: this.route, queryParams: { id: this.id } });
  }
}
