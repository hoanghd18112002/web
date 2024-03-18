import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DoithongtinComponent } from './doithongtin.component';

describe('DoithongtinComponent', () => {
  let component: DoithongtinComponent;
  let fixture: ComponentFixture<DoithongtinComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DoithongtinComponent]
    });
    fixture = TestBed.createComponent(DoithongtinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
