import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { LoadScriptService } from 'src/app/service/loadscript.service';

@Component({
  selector: 'app-layout-client',
  templateUrl: './layout-client.component.html',
  styleUrls: ['./layout-client.component.css'],
})
export class LayoutClientComponent implements OnInit {
  constructor(private router: Router, private load: LoadScriptService) {}

  ngOnInit(): void {
    this.loadScripts();

    this.router.events.pipe(
      filter((event) => event instanceof NavigationEnd)
    ).subscribe(() => {
      this.loadScripts();
    });
  }

  private async loadScripts(): Promise<void> {
    // await this.load.loadScript('assets/client/js/vendor/modernizr-3.6.0.min.js');
    // await this.load.loadScript('assets/client/js/vendor/jquery-3.3.1.min.js');
    // await this.load.loadScript('assets/client/js/vendor/popper.min.js');
    await this.load.loadScript('assets/client/js/vendor/bootstrap.min.js');
    // await this.load.loadScript('assets/client/js/plugins.js');
    // await this.load.loadScript('assets/client/js/ajax-mail.js');
    // await this.load.loadScript('assets/client/js/switcher.js');
    await this.load.loadScript('assets/client/js/main.js');
  }
}