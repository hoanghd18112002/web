import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdFooterComponent } from './ad-footer.component';

describe('AdFooterComponent', () => {
  let component: AdFooterComponent;
  let fixture: ComponentFixture<AdFooterComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AdFooterComponent]
    });
    fixture = TestBed.createComponent(AdFooterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
