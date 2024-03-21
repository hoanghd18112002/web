import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private apiUrl = 'http://localhost:5226/api/nguoidung';
  private currentUser: any;

  constructor(
    private http: HttpClient
  ) {}

  login(nguoidung: object): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, nguoidung).pipe(
        catchError((error) => {
            return of(error.error);
        })
    );
  }

  logout() {
    localStorage.removeItem('user');
    this.currentUser = null;
    location.assign('/login');
  }

  isAuthenticated(): boolean {
    const user = this.getCurrentUser();
    return !!user && !!user.token;
  }

  getCurrentUser(): any {
    const storedUser = localStorage.getItem('user');
    this.currentUser = storedUser ? JSON.parse(storedUser) : null;
    return this.currentUser;
  }

  loadUser() {
    const userString = localStorage.getItem('user');
    if (userString) {
      return JSON.parse(userString);
    } else {
      return null;
    }
  }  
}
