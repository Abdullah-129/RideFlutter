import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { GoogleMap, MapPolygon } from '@angular/google-maps';
import { ActivatedRoute, Router } from '@angular/router';
import { UpdateFleetGQL, ViewFleetQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { COUNTRY_CODE_LIST } from '@ridy/admin-panel/src/app/country-codes';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, Subscription } from 'rxjs';

@Component({
  selector: 'app-fleet-view-details',
  templateUrl: './fleet-view-details.component.html'
})
export class FleetViewDetailsComponent implements AfterViewInit {
  form = this.fb.group({
    id: [null, Validators.required],
    name: [null, Validators.required],
    phoneNumber: [null, Validators.required],
    mobileNumber: [null, Validators.required],
    accountNumber: [null, Validators.required],
    commissionSharePercent: [0, Validators.required],
    commissionShareFlat: [0, Validators.required],
    feeMultiplier: [null],
    address: [null],
    exclusivityAreas: [null]
  });
  @ViewChild(GoogleMap, { static: false }) map!: GoogleMap;
  center = { lat: 24, lng: 12 };
  drawingManager?: google.maps.drawing.DrawingManager;
  countryCodes = COUNTRY_CODE_LIST;
  subscription?: Subscription;
  polygons: any[] = [];
  
  constructor(
    private route: ActivatedRoute,
    private fb: UntypedFormBuilder,
    public tagColor: TagColorService,
    private updateGQL: UpdateFleetGQL,
    private msg: NzMessageService,
    private router: Router) { }

  // ngOnInit(): void {
  //   this.subscription = this.route.parent?.data.subscribe(data => (this.form.patchValue(data.fleet.data.fleet)));
  // }

  ngAfterViewInit(): void {
    this.initializeDrawingManager();
  }

  initializeDrawingManager() {
    this.subscription = this.route.parent!.data.subscribe(data => {

      if (data.fleet != null) {
        const val: ViewFleetQuery = data.fleet.data;
        const fleet = val.fleet;
        if (fleet != null) {
          this.form.patchValue(fleet);
          if (fleet.exclusivityAreas != null && fleet.exclusivityAreas.length > 0) {
            const latlngbounds = new google.maps.LatLngBounds();
            for (const poly of fleet.exclusivityAreas) {
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
        if (this.form.value.exclusivityAreas == null) {
          this.form.value.exclusivityAreas = [ar];
        } else {
          this.form.value.exclusivityAreas.push(ar);
        }
      }
    });
  }

  async onSubmit() {
    const { id, ..._formValue } = this.form.value;
    try {
      const result = await firstValueFrom(this.updateGQL.mutate({ id ,update: _formValue }));
      this.msg.success('Success');
    this.router.navigateByUrl('/management/fleets');
    } catch(error: any) {
      this.msg.error(error.message);
    }
  }

  clearMap() {
    for(let poly of this.polygons) {
      poly.setMap(null);
    }
    this.polygons = [];
    this.form.patchValue({ exclusivityAreas: [] });
    this.drawingManager?.setValues(null);
  }
}
