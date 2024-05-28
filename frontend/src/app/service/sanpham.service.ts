import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class SanPhamService {
  private apiUrl = `${API_BASE_URL}/sanpham`;

  constructor(private http: HttpClient) {}

  getsanphammoi(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-moi/${sl}`);
  }

  getsanphambanchay(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-ban-chay/${sl}`);
  }

  getsanphamgiamgia(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-giam-gia/${sl}`);
  }
  
  getsanphamngaunhien(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-random/${sl}`);
  }

  getall(sanpham: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/get-all`, sanpham, { headers });
  }

  search(sanpham: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/search`, sanpham);
  } 

  getnew(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-new`, { headers });
  }

  getbyid(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`);
  }

  create(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/create`, object, { headers });
  }

  update(object: object): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/update`, object, { headers });
  }

  detele(id: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/delete/${id}`, { headers });
  } 
}
