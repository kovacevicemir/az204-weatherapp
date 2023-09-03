import { Component } from '@angular/core';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-userinput',
  templateUrl: './userinput.component.html',
  styleUrls: ['./userinput.component.css']
})
export class UserinputComponent {
  constructor(private apiService: ApiService){

  }

  handleInput():void{
    this.apiService.callAzureFunction();
  }
}
