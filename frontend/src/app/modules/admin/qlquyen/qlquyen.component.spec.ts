import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlquyenComponent } from './qlquyen.component';

describe('QlquyenComponent', () => {
  let component: QlquyenComponent;
  let fixture: ComponentFixture<QlquyenComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlquyenComponent]
    });
    fixture = TestBed.createComponent(QlquyenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
