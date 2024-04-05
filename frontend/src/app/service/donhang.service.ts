import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { API_BASE_URL } from 'src/app/service/api';

const _user = JSON.parse(localStorage.getItem('user') || '{}');
const headers = new HttpHeaders().set('Authorization', 'Bearer ' + _user.token);

@Injectable({
  providedIn: 'root',
})
export class DonHangService {
  private apiUrl = `${API_BASE_URL}/donhang`;
  private apiUrl1 = `${API_BASE_URL}/chitietdonhang`;

  constructor(private http: HttpClient) {}
  
  getByNguoiDung(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/get-by-nguoi-dung`, object, { headers });
  } 

  getbydonhang(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl1}/get-by-don-hang/${id}`, { headers });
  }

  getall(donhang: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/get-all`, donhang, { headers });
  }

  getnew(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/get-new`, { headers });
  }  

  getbyid(id: number): Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/get-by-id/${id}`, { headers });
  } 

  createDonHang(donhang: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/create`, donhang, { headers });
  }  

  createCTDonHang(ctdonhang: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl1}/create`, ctdonhang, { headers });
  } 

  update(object: object): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/update/`, object, { headers });
  }

  excel(id: number): Observable<Blob> {
    return this.http.get(`${this.apiUrl1}/excel/${id}`, { headers, responseType: 'blob' });
  }

  orderEmail(object: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/order-email`, object, { headers });
  } 
}
