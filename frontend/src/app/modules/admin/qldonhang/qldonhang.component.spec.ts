import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QldonhangComponent } from './qldonhang.component';

describe('QldonhangComponent', () => {
  let component: QldonhangComponent;
  let fixture: ComponentFixture<QldonhangComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QldonhangComponent]
    });
    fixture = TestBed.createComponent(QldonhangComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
