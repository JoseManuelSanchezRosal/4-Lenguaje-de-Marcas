import { Component } from '@angular/core';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-menu',// app-menu es el nombre para hacer la llamada al componente
  imports: [MatSidenavModule,
    MatListModule,
    MatIconModule,
    RouterModule],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css',
  standalone: true,
})
export class MENUComponent {

}
