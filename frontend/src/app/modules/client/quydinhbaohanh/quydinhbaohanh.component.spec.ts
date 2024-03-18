import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuydinhbaohanhComponent } from './quydinhbaohanh.component';

describe('QuydinhbaohanhComponent', () => {
  let component: QuydinhbaohanhComponent;
  let fixture: ComponentFixture<QuydinhbaohanhComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QuydinhbaohanhComponent]
    });
    fixture = TestBed.createComponent(QuydinhbaohanhComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
