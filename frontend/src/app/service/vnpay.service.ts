import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const _user = JSON.parse(localStorage.getItem('user') || '{}');

@Injectable({
  providedIn: 'root',
})
export class VnPayService {
  private apiUrl = 'http://localhost:5226/api/vnpay';

  constructor(private http: HttpClient) {}

  vnpay(object: object): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.post<any>(`${this.apiUrl}/vnpay`, object, { headers });
  }

  callback(data: any): Observable<any> {
    const queryString = Object.keys(data).map(key => key + '=' + encodeURIComponent(data[key])).join('&');
    const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);
    return this.http.get<any>(`${this.apiUrl}/callback?${queryString}`, { headers });
  }
}
