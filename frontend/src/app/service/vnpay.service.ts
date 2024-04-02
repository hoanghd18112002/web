import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class VnPayService {
  private apiUrl = `${API_BASE_URL}/vnpay`;

  constructor(private http: HttpClient) {}

  vnpay(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/vnpay`, object, { headers });
  }

  callback(data: any): Observable<any> {
    const queryString = Object.keys(data).map(key => key + '=' + encodeURIComponent(data[key])).join('&');
    return this.http.get<any>(`${this.apiUrl}/callback?${queryString}`, { headers });
  }
}
