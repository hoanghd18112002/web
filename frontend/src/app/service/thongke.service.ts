import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class ThongKeService {
  private apiUrl = 'http://localhost:5226/api/thongke';

  constructor(private http: HttpClient) {}
  
  getdoanhthutheothang(sl: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/doanh-thu-theo-thang/${sl}`, { headers });
  }

  getdoanhthusanpham(sl: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/doanh-thu-san-pham/${sl}`, { headers });
  }

  getloaisanphambanchay(sl: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/loai-san-pham-ban-chay/${sl}`, { headers });
  }

  getsoluong(): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/so-luong`, { headers });
  }
}
