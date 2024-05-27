import { Component, HostListener } from '@angular/core';

@Component({
  selector: 'app-scroll',
  templateUrl: './scroll.component.html',
  styleUrls: ['./scroll.component.css']
})
export class ScrollComponent {

  // Phương thức để cuộn lên đầu trang
  scrollToTop(): void {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  // Lắng nghe sự kiện cuộn để hiển thị hoặc ẩn nút cuộn lên
  @HostListener('window:scroll', [])
  onWindowScroll(): void {
    const scrollButton = document.querySelector('.scroll-top');
    if (scrollButton) {
      if (window.pageYOffset > 300) {
        scrollButton.classList.remove('not-visible');
      } else {
        scrollButton.classList.add('not-visible');
      }
    }
  }
}
