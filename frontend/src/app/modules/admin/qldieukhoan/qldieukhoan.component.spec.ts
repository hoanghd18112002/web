import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QldieukhoanComponent } from './qldieukhoan.component';

describe('QldieukhoanComponent', () => {
  let component: QldieukhoanComponent;
  let fixture: ComponentFixture<QldieukhoanComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QldieukhoanComponent]
    });
    fixture = TestBed.createComponent(QldieukhoanComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
