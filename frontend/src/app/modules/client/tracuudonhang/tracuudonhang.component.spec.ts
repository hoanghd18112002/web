import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TracuudonhangComponent } from './tracuudonhang.component';

describe('TracuudonhangComponent', () => {
  let component: TracuudonhangComponent;
  let fixture: ComponentFixture<TracuudonhangComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TracuudonhangComponent]
    });
    fixture = TestBed.createComponent(TracuudonhangComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
