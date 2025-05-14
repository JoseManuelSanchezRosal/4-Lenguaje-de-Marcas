import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SOBREMIComponent } from './sobre-mi.component';

describe('SOBREMIComponent', () => {
  let component: SOBREMIComponent;
  let fixture: ComponentFixture<SOBREMIComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SOBREMIComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SOBREMIComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
