import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlloaisanphamComponent } from './qlloaisanpham.component';

describe('QlloaisanphamComponent', () => {
  let component: QlloaisanphamComponent;
  let fixture: ComponentFixture<QlloaisanphamComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlloaisanphamComponent]
    });
    fixture = TestBed.createComponent(QlloaisanphamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
