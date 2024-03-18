import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlphuongthucComponent } from './qlphuongthuc.component';

describe('QlphuongthucComponent', () => {
  let component: QlphuongthucComponent;
  let fixture: ComponentFixture<QlphuongthucComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlphuongthucComponent]
    });
    fixture = TestBed.createComponent(QlphuongthucComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
