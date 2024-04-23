import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class LoadScriptService {

  loadJs(url: string): void {
    const script = document.createElement('script');
    script.src = url;
    document.body.appendChild(script);
  }

  loadMultipleJs(urls: string[]): void {
    urls.forEach(url => this.loadJs(url));
  }

  loadCss(url: string): void {
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = url;
    document.head.appendChild(link);
  }

  loadMultipleCss(urls: string[]): void {
    urls.forEach(url => this.loadCss(url));
  }
}
