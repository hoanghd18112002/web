import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlnguoidungComponent } from './qlnguoidung.component';

describe('QlnguoidungComponent', () => {
  let component: QlnguoidungComponent;
  let fixture: ComponentFixture<QlnguoidungComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlnguoidungComponent]
    });
    fixture = TestBed.createComponent(QlnguoidungComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
