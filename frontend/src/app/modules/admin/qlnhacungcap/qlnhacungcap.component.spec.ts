import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlnhacungcapComponent } from './qlnhacungcap.component';

describe('QlnhacungcapComponent', () => {
  let component: QlnhacungcapComponent;
  let fixture: ComponentFixture<QlnhacungcapComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlnhacungcapComponent]
    });
    fixture = TestBed.createComponent(QlnhacungcapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
