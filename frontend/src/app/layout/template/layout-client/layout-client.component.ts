import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-layout-client',
  templateUrl: './layout-client.component.html',
  styleUrls: ['./layout-client.component.css'],
})
export class LayoutClientComponent implements OnInit, OnDestroy {
  constructor() {}

  ngOnInit(): void {
    this.loadCss();
    this.loadScripts();
  }

  ngOnDestroy(): void {
    this.removeCss();
    this.removeScripts();
    window.location.reload();
  }

  private loadCss(): void {
    const links = [
      'assets/client/css/bootstrap.min.css',
      'assets/client/css/font-awesome.min.css',
      'assets/client/css/helper.min.css',
      'assets/client/css/plugins.css',
      'assets/client/css/style.css',
      'assets/client/css/skin-default.css',
    ];

    links.forEach(link => {
      const styleElement = document.createElement('link');
      styleElement.rel = 'stylesheet';
      styleElement.href = link;
      document.head.appendChild(styleElement);
    });
  }

  private loadScripts(): void {
    const scripts = [
      'assets/client/js/vendor/modernizr-3.6.0.min.js',
      'assets/client/js/vendor/jquery-3.3.1.min.js',
      'assets/client/js/vendor/popper.min.js',
      'assets/client/js/vendor/bootstrap.min.js',
      'assets/client/js/plugins.js',
      'assets/client/js/main.js',
      'assets/client/js/switcher.js',
    ];

    scripts.forEach(script => {
      const scriptElement = document.createElement('script');
      scriptElement.src = script;
      document.body.appendChild(scriptElement);
    });
  }

  private removeCss(): void {
    const links = document.head.querySelectorAll('link[rel="stylesheet"]');
    links.forEach(link => {
      document.head.removeChild(link);
    });
  }

  private removeScripts(): void {
    const scripts = document.body.querySelectorAll('script');
    scripts.forEach(script => {
      document.body.removeChild(script);
    });
  }
}
