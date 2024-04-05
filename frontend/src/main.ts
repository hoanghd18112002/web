import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app/app.module';
import { ThamsoService } from './app/service/thamso.service';

platformBrowserDynamic().bootstrapModule(AppModule)
  .then(platformRef => {
    const thamSoService = platformRef.injector.get(ThamsoService);
    thamSoService.getbyma("ICON").subscribe(res => {
      const icon = "/assets/client/img/logo/" + res.data.anh;
      const faviconLink = document.getElementById('faviconLink') as HTMLLinkElement;
      if (faviconLink) {faviconLink.href = icon;}
    });
  })
  .catch(err => console.error(err));
