import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlhoadonnhapComponent } from './qlhoadonnhap.component';

describe('QlhoadonnhapComponent', () => {
  let component: QlhoadonnhapComponent;
  let fixture: ComponentFixture<QlhoadonnhapComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlhoadonnhapComponent]
    });
    fixture = TestBed.createComponent(QlhoadonnhapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
