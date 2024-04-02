import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NhapsoluongComponent } from './nhapsoluong.component';

describe('NhapsoluongComponent', () => {
  let component: NhapsoluongComponent;
  let fixture: ComponentFixture<NhapsoluongComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [NhapsoluongComponent]
    });
    fixture = TestBed.createComponent(NhapsoluongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
