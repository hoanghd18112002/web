import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DanhmucsanphamComponent } from './danhmucsanpham.component';

describe('DanhmucsanphamComponent', () => {
  let component: DanhmucsanphamComponent;
  let fixture: ComponentFixture<DanhmucsanphamComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DanhmucsanphamComponent]
    });
    fixture = TestBed.createComponent(DanhmucsanphamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
