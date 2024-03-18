import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QlmenuComponent } from './qlmenu.component';

describe('QlmenuComponent', () => {
  let component: QlmenuComponent;
  let fixture: ComponentFixture<QlmenuComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QlmenuComponent]
    });
    fixture = TestBed.createComponent(QlmenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
