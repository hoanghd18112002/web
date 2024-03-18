import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChinhsachbaomatComponent } from './chinhsachbaomat.component';

describe('ChinhsachbaomatComponent', () => {
  let component: ChinhsachbaomatComponent;
  let fixture: ComponentFixture<ChinhsachbaomatComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ChinhsachbaomatComponent]
    });
    fixture = TestBed.createComponent(ChinhsachbaomatComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
