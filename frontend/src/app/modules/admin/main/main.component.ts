import { Component } from '@angular/core';
import { Chart } from 'chart.js/auto';
import { ThongKeDoanhThuTheoThang, ThongKeDoanhThuSanPham, ThongKeDoanhThuLoaiSanPham, ThongKeSoLuong, ThongKeDoanhThuTheoNam, ThongKeDoanhThuTheoQuy } from 'src/app/models/thongke.model';
import { ThongKeService } from 'src/app/service/thongke.service';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent {
  ThongKeSoLuong: any;
  ThongKeDoanhThuThang: ThongKeDoanhThuTheoThang[] = [];
  ThongKeDoanhThuNam: ThongKeDoanhThuTheoNam[] = [];
  ThongKeDoanhThuQuy: ThongKeDoanhThuTheoQuy[] = [];
  ThongKeDoanhThuSanPham: ThongKeDoanhThuSanPham[] = [];
  ThongKeDoanhThuLoaiSanPham: ThongKeDoanhThuLoaiSanPham[] = []

  soThang: number = 12;
  soLoaiSanPham: number = 5;
  soSanPham: number = 5;
  thongkenam: number = (new Date()).getFullYear();
  thongkequy: number = (new Date()).getFullYear();

  chart: any;
  chart1: any;
  chart2: any;
  chart3: any;
  chart4: any;

  constructor(private thongKeService: ThongKeService){}

  ngOnInit(): void{
    this.LoadDoanhThuTheoThang();
    this.LoadDoanhThuTheoNam();
    this.LoadDoanhThuTheoQuy();
    this.LoadDoanhThuLoaiSanPham()
    this.LoadDoanhThuSanPham();
    this.LoadSoLuong();
  }

  ngOnDestroy(): void {
    if (this.chart) {
      this.chart.destroy();
    }
    if (this.chart1) {
      this.chart1.destroy();
    }
    if (this.chart2) {
      this.chart2.destroy();
    }
    if (this.chart3) {
      this.chart3.destroy();
    }
    if (this.chart4) {
      this.chart4.destroy();
    }
  }

  //Lấy danh sách toàn bộ doanh thu theo tháng
  LoadDoanhThuTheoThang(){
    this.thongKeService.getdoanhthutheothang(this.soThang).subscribe(res => {
      this.ThongKeDoanhThuThang = res.data;

      const thoiGian = this.ThongKeDoanhThuThang.map(item => item.thoiGian);
      const doanhThu = this.ThongKeDoanhThuThang.map(item => item.doanhThuTheoThang);

      const data = {
        labels: thoiGian,
        datasets: [{
          label: 'Doanh thu theo tháng',
          data: doanhThu,
          fill: false,
          tension: 0.1,
          backgroundColor: '#6677ef'
        }]
      };

      if (this.chart) {
        this.chart.destroy();
      }

      this.chart = new Chart("chart", {
        type: 'bar',
        data: data
      })
    });
  }

  // Lấy danh sách toàn bộ doanh thu theo năm
  LoadDoanhThuTheoNam(){
    this.thongKeService.getdoanhthutheonam(this.thongkenam).subscribe(res => {
      this.ThongKeDoanhThuNam = res.data;

      const thoiGian = this.ThongKeDoanhThuNam.map(item => item.thoiGian);
      const doanhThu = this.ThongKeDoanhThuNam.map(item => item.doanhThuTheoNam);

      const data = {
        labels: thoiGian,
        datasets: [{
          label: 'Doanh thu theo năm',
          data: doanhThu,
          fill: false,
          tension: 0.1,
          backgroundColor: '#9966FF'
        }]
      };

      if (this.chart1) {
        this.chart1.destroy();
      }

      this.chart1 = new Chart("chart1", {
        type: 'bar',
        data: data
      })
    });
  }

  // Lấy danh sách toàn bộ doanh thu theo quý
  LoadDoanhThuTheoQuy(){
    this.thongKeService.getdoanhthutheoquy(this.thongkequy).subscribe(res => { 
      this.ThongKeDoanhThuQuy = res.data;

      const thoiGian = this.ThongKeDoanhThuQuy.map(item => item.thoiGian);
      const doanhThu = this.ThongKeDoanhThuQuy.map(item => item.doanhThuTheoQuy);

      const data = {
        labels: thoiGian,
        datasets: [{
          label: 'Doanh thu theo quý',
          data: doanhThu,
          fill: false,
          tension: 0.1,
          backgroundColor: '#4BC0C0'
        }]
      };

      if (this.chart2) {
        this.chart2.destroy();
      }

      this.chart2 = new Chart("chart2", {
        type: 'bar',
        data: data
      })
    });
  }

  //Lấy danh sách loại sản phẩm bán chạy nhất
  LoadDoanhThuLoaiSanPham(){
    this.thongKeService.getloaisanphambanchay(this.soLoaiSanPham).subscribe(res => {
      this.ThongKeDoanhThuLoaiSanPham = res.data;

      const loaisanpham = this.ThongKeDoanhThuLoaiSanPham.map(item => item.tenLoai);
      const soluong = this.ThongKeDoanhThuLoaiSanPham.map(item => item.soLuong);

      const data = {
        labels: loaisanpham,
        datasets: [{
          label: ' Số lượng',
          data: soluong,
          backgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
            '#4BC0C0',
            '#9966FF',
            '#FF9F40',
            '#63FF84',
            '#FF4040',
            '#8A2BE2',
            '#7FFF00',
          ],
          hoverOffset: 10
        }]
      };

      if (this.chart3) {
        this.chart3.destroy();
      }

      this.chart3 = new Chart("chart3", {
        type: 'doughnut',
        data: data
      })
    });
  }

  //Lấy danh sách sản phẩm bán chạy nhất
  LoadDoanhThuSanPham() {
    this.thongKeService.getdoanhthusanpham(this.soSanPham).subscribe(res => {
      this.ThongKeDoanhThuSanPham = res.data;

      const ten = this.ThongKeDoanhThuSanPham.map(item => item.ten);
      const doanhThu = this.ThongKeDoanhThuSanPham.map(item => item.doanhThu);

      const data = {
        labels: ten,
        datasets: [{
          label: ' Số lượng',
          data: doanhThu,
          backgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
            '#4BC0C0',
            '#9966FF',
            '#FF9F40',
            '#63FF84',
            '#FF4040',
            '#8A2BE2',
            '#7FFF00',
          ],
          hoverOffset: 10
        }]
      };

      if (this.chart4) {
        this.chart4.destroy();
      }

      this.chart4 = new Chart("chart4", {
        type: 'polarArea',
        data: data,
        options: {}
      });
    });
  } 

  //Lấy số lượng 
  LoadSoLuong(){
    this.thongKeService.getsoluong().subscribe(res => {
      this.ThongKeSoLuong = res.data[0];
    });
  }
}
