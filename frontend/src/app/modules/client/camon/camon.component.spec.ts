import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CamonComponent } from './camon.component';

describe('CamonComponent', () => {
  let component: CamonComponent;
  let fixture: ComponentFixture<CamonComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CamonComponent]
    });
    fixture = TestBed.createComponent(CamonComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
