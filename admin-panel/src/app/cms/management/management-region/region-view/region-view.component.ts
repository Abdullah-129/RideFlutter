import { AfterViewInit, Component, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { GoogleMap } from '@angular/google-maps';
import { ActivatedRoute, Router } from '@angular/router';
import { CreateRegionGQL, RegionViewQuery, UpdateRegionGQL } from '@ridy/admin-panel/generated/graphql';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';
import { CURRENCY_LIST } from "../../../../currencies";

@Component({
  selector: 'app-region-view',
  templateUrl: './region-view.component.html'
})
export class RegionViewComponent implements AfterViewInit {
  form = this.fb.group({
    id: [null],
    name: [null, Validators.required],
    currency: [null, Validators.required],
    enabled: [true, Validators.required],
    location: [null]
  });
  @ViewChild(GoogleMap, { static: false }) map!: GoogleMap;
  center = { lat: 24, lng: 12 };
  drawingManager?: google.maps.drawing.DrawingManager;
  currencies = CURRENCY_LIST;
  polygons: any[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: UntypedFormBuilder,
    private createGQL: CreateRegionGQL,
    private updateGQL: UpdateRegionGQL,
    private msg: NzMessageService) { }

  ngAfterViewInit(): void {
    this.initializeDrawingManager();
  }

  initializeDrawingManager() {
    this.route.data.subscribe(data => {
      if (data.region != null) {
        const val: RegionViewQuery = data.region.data;
        const region = val.region;
        if (region != null) {
          this.form.patchValue(region);
          if (region.location != null) {
            const latlngbounds = new google.maps.LatLngBounds();
            for (const poly of region.location) {
              for (const location of poly) {
                latlngbounds.extend(location);
              }
            }
            this.map.fitBounds(latlngbounds);
          }
        }
      }
    });
    this.drawingManager = new google.maps.drawing.DrawingManager({
      drawingMode: google.maps.drawing.OverlayType.POLYGON,
      drawingControl: true,
      map: this.map?.googleMap,
      drawingControlOptions: {
        position: google.maps.ControlPosition.TOP_CENTER,
        drawingModes: [google.maps.drawing.OverlayType.POLYGON]
      }
    });
    google.maps.event.addListener(this.drawingManager, 'overlaycomplete', (event: any) => {
      this.polygons?.push(event.overlay);
      if (event.type === google.maps.drawing.OverlayType.POLYGON) {
        const ar = event.overlay.getPath().getArray();
        ar.push(ar[0]);
        if (this.form.value.location == null) {
          this.form.value.location = [ar];
        } else {
          this.form.value.location.push(ar);
        }
      }
    });
  }

  async onSubmit() {
    try {
      const { id, ...update } = this.form.value;
      if (id == null) {
        await firstValueFrom(this.createGQL.mutate({ input: update }));
      } else {
        await firstValueFrom(this.updateGQL.mutate({ id, update }));
      }
      this.router.navigate(['management/regions'], { relativeTo: this.route.root });
    } catch(error: any) {
      this.msg.error(error.message);
    }
    
  }

  clearMap() {
    for(let poly of this.polygons) {
      poly.setMap(null);
    }
    this.polygons = [];
    this.form.value.location = [];
    this.form.patchValue({ location: [] });
  }
}
