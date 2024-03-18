import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class ThongSoService {
  private apiUrl = 'http://localhost:5226/api/thongso';

  constructor(private http: HttpClient) {}
  
  getbysanpham(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-san-pham/${id}`);
  }

  getbyid(id: number): Observable<any>{
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`, { headers });
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

  deteleall(id: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.delete<any>(`${this.apiUrl}/delete-by-san-pham/${id}`, { headers });
  } 
}
