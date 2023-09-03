import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  constructor(private http: HttpClient) { }

  callAzureFunction() {
    this.http.get<any>('https://weatherapp-backend-function.azurewebsites.net')
      .subscribe(response => {
        console.log(response); // Handle the response as needed
      });
  }
}
