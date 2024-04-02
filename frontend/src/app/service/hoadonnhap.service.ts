import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class HoaDonNhapService {
  private apiUrl = `${API_BASE_URL}/hoadonnhap`;
  private apiUrl1 = `${API_BASE_URL}/chitiethoadonnhap`;
  
  constructor(private http: HttpClient) {}

  getall(hoadonnhap: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/get-all`, hoadonnhap, { headers });
  }

  getnew(): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-new`, { headers });
  }

  getbyid(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`, { headers });
  }

  getbyhoadonnhap(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl1}/get-by-hoa-don-nhap/${id}`, { headers });
  }

  create(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/create`, object, { headers });
  }

  createCTHoaDonNhap(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl1}/create`, object, { headers });
  }

  update(object: object): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/update`, object, { headers });
  }

  detele(id: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/delete/${id}`, { headers });
  } 

  excel(id: number): Observable<Blob> {
    return this.http.get(`${this.apiUrl1}/excel/${id}`, { headers, responseType: 'blob' });
  }
}
