import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QltintucComponent } from './qltintuc.component';

describe('QltintucComponent', () => {
  let component: QltintucComponent;
  let fixture: ComponentFixture<QltintucComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QltintucComponent]
    });
    fixture = TestBed.createComponent(QltintucComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
