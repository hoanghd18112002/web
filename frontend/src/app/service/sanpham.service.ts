import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class SanPhamService {
  private apiUrl = 'http://localhost:5226/api/sanpham';

  constructor(private http: HttpClient) {}

  getsanphammoi(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-moi/10`);
  }

  getsanphambanchay(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-ban-chay/10`);
  }

  getsanphamgiamgia(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-san-pham-giam-gia/10`);
  }
  
  getsanphamngaunhien(sl: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-random/${sl}`);
  }

  getall(sanpham: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.post<any>(`${this.apiUrl}/get-all`, sanpham, { headers });
  }

  search(sanpham: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/search`, sanpham);
  } 

  getnew(): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/get-new`, { headers });
  }

  getbyid(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`);
  }

  create(object: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.post<any>(`${this.apiUrl}/create`, object, { headers });
  }

  update(object: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.put<any>(`${this.apiUrl}/update`, object, { headers });
  }

  detele(id: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.delete<any>(`${this.apiUrl}/delete/${id}`, { headers });
  } 
}
