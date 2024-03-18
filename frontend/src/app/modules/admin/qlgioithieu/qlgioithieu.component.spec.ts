import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlgioithieuComponent } from './qlgioithieu.component';

describe('QlgioithieuComponent', () => {
  let component: QlgioithieuComponent;
  let fixture: ComponentFixture<QlgioithieuComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlgioithieuComponent]
    });
    fixture = TestBed.createComponent(QlgioithieuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
