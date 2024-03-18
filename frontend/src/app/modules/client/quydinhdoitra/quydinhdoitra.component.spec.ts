import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuydinhdoitraComponent } from './quydinhdoitra.component';

describe('QuydinhdoitraComponent', () => {
  let component: QuydinhdoitraComponent;
  let fixture: ComponentFixture<QuydinhdoitraComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QuydinhdoitraComponent]
    });
    fixture = TestBed.createComponent(QuydinhdoitraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
