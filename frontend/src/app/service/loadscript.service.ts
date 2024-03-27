import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class LoadScriptService {
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
}
