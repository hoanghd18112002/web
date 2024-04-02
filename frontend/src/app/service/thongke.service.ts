import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class ThongKeService {
  private apiUrl = `${API_BASE_URL}/thongke`;

  constructor(private http: HttpClient) {}
  
  getdoanhthutheothang(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/doanh-thu-theo-thang/${sl}`, { headers });
  }

  getdoanhthusanpham(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/doanh-thu-san-pham/${sl}`, { headers });
  }

  getloaisanphambanchay(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/loai-san-pham-ban-chay/${sl}`, { headers });
  }

  getsoluong(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/so-luong`, { headers });
  }
}
