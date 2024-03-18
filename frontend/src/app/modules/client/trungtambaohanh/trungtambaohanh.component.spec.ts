import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TrungtambaohanhComponent } from './trungtambaohanh.component';

describe('TrungtambaohanhComponent', () => {
  let component: TrungtambaohanhComponent;
  let fixture: ComponentFixture<TrungtambaohanhComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TrungtambaohanhComponent]
    });
    fixture = TestBed.createComponent(TrungtambaohanhComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
