import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class LoadScriptService {
  private styles: any = {};
  
  loadScript(src: string): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      // Tạo một thẻ script
      const script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = src;
      script.onload = () => {
        resolve();
      };
      script.onerror = (error: any) => reject(`Could not load script ${src}`);
      document.body.appendChild(script);
    });
  }

  loadCSS(href: string): Promise<void> {
    return new Promise<void>((resolve, reject) => {
        // If the CSS file has been loaded before, don't load it again
        if (this.styles[href]) {
            resolve();
        } else {
            // Create a link element for the CSS file
            const link = document.createElement('link');
            link.rel = 'stylesheet';
            link.type = 'text/css';
            link.href = href;
            link.onload = () => {
                this.styles[href] = true;
                resolve();
            };
            link.onerror = (error: any) => reject(`Could not load CSS ${href}`);
            document.head.appendChild(link);
        }
    });
  } 
}
