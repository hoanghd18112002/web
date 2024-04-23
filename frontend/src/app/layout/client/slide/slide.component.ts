import { Component } from '@angular/core';
import { Slide } from 'src/app/models/slide.model';
import { SlideService } from 'src/app/service/slide.service';
import { OwlOptions } from 'ngx-owl-carousel-o';

@Component({
  selector: 'app-slide',
  templateUrl: './slide.component.html',
  styleUrls: ['./slide.component.css']
})
export class SlideComponent {
  ListSlide: Slide[] = [];

  constructor(
    private slideService: SlideService
  ) {}

  ngOnInit() {
    this.getallslide();
  }

  //Load slide
  getallslide() {
    this.slideService.get().subscribe(res => {
      this.ListSlide = res.data;
    });
  }  

  slide: OwlOptions = {
    loop: true,
    autoplay: true,
    autoplayHoverPause: true,
    autoplayTimeout: 5000,
    smartSpeed: 1000,
    responsive: {
      0: {
        items: 1
      }
    }
  };
}
