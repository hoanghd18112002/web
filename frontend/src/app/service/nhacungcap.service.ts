import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class NhaCungCapService {
  private apiUrl = `${API_BASE_URL}/nhacungcap`;

  constructor(private http: HttpClient) {}
  
  get(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get`, { headers });
  }
  
  getall(nhacungcap: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/get-all`, nhacungcap, { headers });
  }

  getbyid(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`, { headers });
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
