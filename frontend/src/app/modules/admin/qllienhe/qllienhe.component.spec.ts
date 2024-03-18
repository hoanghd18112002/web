import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QllienheComponent } from './qllienhe.component';

describe('QllienheComponent', () => {
  let component: QllienheComponent;
  let fixture: ComponentFixture<QllienheComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QllienheComponent]
    });
    fixture = TestBed.createComponent(QllienheComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
