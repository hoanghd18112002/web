import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-layout-admin',
  templateUrl: './layout-admin.component.html',
  styleUrls: ['./layout-admin.component.css']
})
export class LayoutAdminComponent implements OnInit, OnDestroy {
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
      'assets/admin/css/app.min.css',
      'assets/admin/css/style.css',
      'assets/admin/css/components.css',
      'assets/admin/css/custom.css',
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
      'assets/admin/js/app.min.js',
      'assets/admin/bundles/datatables/datatables.min.js',
      'assets/admin/bundles/jquery-ui/jquery-ui.min.js',
      'assets/admin/js/page/datatables.js',
      'assets/admin/js/scripts.js',
      'assets/admin/js/custom.js',
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
