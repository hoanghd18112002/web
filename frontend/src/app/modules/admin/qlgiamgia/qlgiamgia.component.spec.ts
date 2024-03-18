import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlgiamgiaComponent } from './qlgiamgia.component';

describe('QlgiamgiaComponent', () => {
  let component: QlgiamgiaComponent;
  let fixture: ComponentFixture<QlgiamgiaComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlgiamgiaComponent]
    });
    fixture = TestBed.createComponent(QlgiamgiaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
