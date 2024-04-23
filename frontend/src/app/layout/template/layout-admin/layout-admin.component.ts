import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-layout-admin',
  templateUrl: './layout-admin.component.html',
  styleUrls: ['./layout-admin.component.css']
})
export class LayoutAdminComponent implements OnInit {
  constructor() {}

  ngOnInit(): void {
    // this.loadCss();
    this.loadScripts();
  }

  // private loadCss(): void {
  //   const links = [
  //     'assets/admin/css/app.min.css',
  //     'assets/admin/css/style.css',
  //     'assets/admin/css/components.css',
  //     'assets/admin/css/custom.css',
  //   ];

  //   links.forEach(link => {
  //     const styleElement = document.createElement('link');
  //     styleElement.rel = 'stylesheet';
  //     styleElement.href = link;
  //     document.head.appendChild(styleElement);
  //   });
  // }

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
}
