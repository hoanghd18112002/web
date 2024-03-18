import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class NguoiDungService {
  private apiUrl = 'http://localhost:5226/api/nguoidung';

  constructor(private http: HttpClient) {}
  
  getall(nguoidung: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.post<any>(`${this.apiUrl}/get-all`, nguoidung, { headers });
  }

  kiemtra(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/check`, object);
  }

  getbyid(id: number): Observable<any>{
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`, { headers });
  }

  create(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/create`, object);
  }

  update(object: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.put<any>(`${this.apiUrl}/update`, object, { headers });
  }

  detele(id: number): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.delete<any>(`${this.apiUrl}/delete/${id}`, { headers });
  } 

  confirmationemail(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/send-confirmation-email`, object);
  }

  confirmemail(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/confirm-email`, object);
  }
}
