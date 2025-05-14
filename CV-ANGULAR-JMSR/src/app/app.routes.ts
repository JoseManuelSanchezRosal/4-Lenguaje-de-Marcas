import { Routes } from '@angular/router';
import { FormacionComponent } from './formacion/formacion.component';
import { MENUComponent } from './menu/menu.component';
import { AppComponent } from './app.component';
import { SOBREMIComponent } from './sobre-mi/sobre-mi.component';
import { ExperienciaLaboralComponent } from './experiencia-laboral/experiencia-laboral.component';
import { ActitudesComponent } from './actitudes/actitudes.component';
import { HabilidadesComponent } from './habilidades/habilidades.component';

export const routes: Routes = [
    { path: '', component: SOBREMIComponent },   
    { path: 'formacion', component: FormacionComponent },
    { path: 'experiencia-laboral', component: ExperienciaLaboralComponent },
    { path: 'actitudes', component: ActitudesComponent},
    { path: 'habilidades', component: HabilidadesComponent}
];