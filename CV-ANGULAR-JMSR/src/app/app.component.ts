import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MENUComponent } from './menu/menu.component';
MENUComponent

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, MENUComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  standalone: true,

})
export class AppComponent {
  title = 'CV-ANGULAR';
}
