import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlthamsoComponent } from './qlthamso.component';

describe('QlthamsoComponent', () => {
  let component: QlthamsoComponent;
  let fixture: ComponentFixture<QlthamsoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlthamsoComponent]
    });
    fixture = TestBed.createComponent(QlthamsoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
