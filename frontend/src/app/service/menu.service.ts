import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class MenuService {
  private apiUrl = 'http://localhost:5226/api/menu';

  constructor(private http: HttpClient) {}

  get(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get`);
  }
  
  getall(menu: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.post<any>(`${this.apiUrl}/get-all`, menu, { headers });
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
}