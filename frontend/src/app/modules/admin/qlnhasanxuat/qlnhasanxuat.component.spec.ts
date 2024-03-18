import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlnhasanxuatComponent } from './qlnhasanxuat.component';

describe('QlnhasanxuatComponent', () => {
  let component: QlnhasanxuatComponent;
  let fixture: ComponentFixture<QlnhasanxuatComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlnhasanxuatComponent]
    });
    fixture = TestBed.createComponent(QlnhasanxuatComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
