import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlslideComponent } from './qlslide.component';

describe('QlslideComponent', () => {
  let component: QlslideComponent;
  let fixture: ComponentFixture<QlslideComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlslideComponent]
    });
    fixture = TestBed.createComponent(QlslideComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
