import { Component } from '@angular/core';
import { LoadScriptService } from 'src/app/service/loadscript.service';

@Component({
  selector: 'app-layout-admin',
  templateUrl: './layout-admin.component.html',
  styleUrls: ['./layout-admin.component.css']
})
export class LayoutAdminComponent {
  constructor(private load: LoadScriptService) {}

  ngOnInit(): void {
    this.loadScripts();
  }

  private async loadScripts(): Promise<void> {
    await this.load.loadScript('assets/admin/js/app.min.js');
    await this.load.loadScript('assets/admin/js/scripts.js');
    await this.load.loadScript('assets/admin/bundles/datatables/datatables.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/dataTables.buttons.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/buttons.flash.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/jszip.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/pdfmake.min.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/vfs_fonts.js');
    await this.load.loadScript('assets/admin/bundles/datatables/export-tables/buttons.print.min.js');
    await this.load.loadScript('assets/admin/js/page/datatables.js');
    // await this.load.loadScript('assets/admin/bundles/apexcharts/apexcharts.min.js');
    // await this.load.loadScript('assets/admin/js/page/index.js');
    await this.load.loadScript('assets/admin/js/custom.js');
  }
}
