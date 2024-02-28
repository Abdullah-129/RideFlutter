import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { GoogleMap } from '@angular/google-maps';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  CreateZonePriceGQL,
  SetZonePriceRelationsGQL,
  TimeMultiplier,
  UpdateZonePriceGQL,
  ZonePriceNewQuery,
  ZonePriceViewQuery,
} from '@ridy/admin-panel/generated/graphql';
import { NzInputNumberComponent } from 'ng-zorro-antd/input-number';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzTimePickerComponent } from 'ng-zorro-antd/time-picker';
import { firstValueFrom, map, Observable } from 'rxjs';

@Component({
  selector: 'app-zone-price-view',
  templateUrl: './zone-price-view.component.html',
})
export class ZonePriceViewComponent implements OnInit, AfterViewInit {
  query?: Observable<ApolloQueryResult<ZonePriceViewQuery | ZonePriceNewQuery>>;
  form = this.fb.group({
    id: [null],
    name: [null, Validators.required],
    from: [[]],
    to: [[]],
    cost: [null, Validators.required],
    fleets: [[]],
    services: [[]],
    timeMultipliers: [[]],
  });
  center = { lat: 24, lng: 12 };
  @ViewChild('timeStartPicker', { static: false })
  timeStartPicker!: NzTimePickerComponent;
  @ViewChild('timeEndPicker', { static: false })
  timeEndPicker!: NzTimePickerComponent;
  @ViewChild('timeMultiplyInput', { static: false })
  timeMultiplyInput!: NzInputNumberComponent;
  @ViewChild('mapFrom', { static: false }) mapFrom!: GoogleMap;
  @ViewChild('mapTo', { static: false }) mapTo!: GoogleMap;
  drawingManagerFrom?: google.maps.drawing.DrawingManager;
  drawingManagerTo?: google.maps.drawing.DrawingManager;
  polygonsFrom: any[] = [];
  polygonsTo: any[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: UntypedFormBuilder,
    private createGQL: CreateZonePriceGQL,
    private updateGQL: UpdateZonePriceGQL,
    private relationsGQL: SetZonePriceRelationsGQL,
    private msg: NzMessageService
  ) {}
  ngOnInit(): void {
    this.query = this.route.data.pipe(map((data) => data.zonePrice));
  }

  ngAfterViewInit(): void {
    this.initializeDrawingManager();
  }

  initializeDrawingManager() {
    this.route.data.subscribe((data) => {
      if (data.zonePrice != null) {
        const val: ZonePriceViewQuery = data.zonePrice.data;
        var zonePrice = val.zonePrice;
        if (zonePrice != null) {
          zonePrice.services = zonePrice.services.map(
            (service) => service.id
          ) as unknown as any;
          zonePrice.fleets = zonePrice.fleets.map(
            (service) => service.id
          ) as unknown as any;

          this.form.patchValue(zonePrice);
        }
      }
    });
    this.drawingManagerFrom = new google.maps.drawing.DrawingManager({
      drawingMode: google.maps.drawing.OverlayType.POLYGON,
      drawingControl: true,
      map: this.mapFrom?.googleMap,
      drawingControlOptions: {
        position: google.maps.ControlPosition.TOP_CENTER,
        drawingModes: [google.maps.drawing.OverlayType.POLYGON],
      },
    });
    google.maps.event.addListener(
      this.drawingManagerFrom,
      'overlaycomplete',
      (event: any) => {
        this.polygonsFrom?.push(event.overlay);
        if (event.type === google.maps.drawing.OverlayType.POLYGON) {
          const ar = event.overlay.getPath().getArray();
          ar.push(ar[0]);
          if (this.form.value.from == null) {
            this.form.value.from = [ar];
          } else {
            this.form.value.from.push(ar);
            this.form.patchValue({ from: this.form.value.from });
          }
        }
      }
    );
    this.drawingManagerTo = new google.maps.drawing.DrawingManager({
      drawingMode: google.maps.drawing.OverlayType.POLYGON,
      drawingControl: true,
      map: this.mapTo?.googleMap,
      drawingControlOptions: {
        position: google.maps.ControlPosition.TOP_CENTER,
        drawingModes: [google.maps.drawing.OverlayType.POLYGON],
      },
    });
    google.maps.event.addListener(
      this.drawingManagerTo,
      'overlaycomplete',
      (event: any) => {
        this.polygonsTo?.push(event.overlay);
        if (event.type === google.maps.drawing.OverlayType.POLYGON) {
          const ar = event.overlay.getPath().getArray();
          ar.push(ar[0]);
          if (this.form.value.to == null) {
            this.form.value.to = [ar];
          } else {
            this.form.value.to.push(ar);
          }
        }
      }
    );
  }

  async onSubmit() {
    try {
      let { id, services, fleets, ...update } = this.form.value;
      console.log(fleets);
      if (id == null) {
        const res = await firstValueFrom(
          this.createGQL.mutate({ input: update })
        );
        id = res.data?.createOneZonePrice.id;
      } else {
        const res = await firstValueFrom(this.updateGQL.mutate({ id, update }));
        id = res.data?.updateOneZonePrice.id;
      }
      await firstValueFrom(this.relationsGQL.mutate({ id, services, fleets }));
      this.router.navigate(['management/zone-prices'], {
        relativeTo: this.route.root,
      });
    } catch (error: any) {
      console.log(error);
      this.msg.error(error.message);
    }
  }

  insertTimeRule() {
    if (this.form.value.timeMultipliers == null) {
      this.form.value.timeMultipliers = [];
    }
    this.form.value.timeMultipliers.push({
      startTime: this.timeStartPicker.inputRef.nativeElement.value,
      endTime: this.timeEndPicker.inputRef.nativeElement.value,
      multiply: parseFloat(
        this.timeMultiplyInput.inputElement.nativeElement.value
      ),
    });
  }

  removeTimeRule(_rule: TimeMultiplier) {
    this.form.value.timeMultipliers = this.form.value.timeMultipliers.filter(
      (rule: any) => rule != _rule
    );
  }
}
