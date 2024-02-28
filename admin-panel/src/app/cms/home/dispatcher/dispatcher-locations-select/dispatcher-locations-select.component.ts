import { Component, OnInit, ViewChild } from '@angular/core';
import { MapInfoWindow, GoogleMap } from '@angular/google-maps';
import { ActivatedRoute, Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { GooglePlacesComponent } from '@ridy/admin-panel/src/app/@components/google-places.component';
import { PointWithAddress } from '@ridy/admin-panel/src/app/@models/coordinatexy';
import { NzMessageService } from 'ng-zorro-antd/message';
import { DispatcherService } from '../dispatcher.service';

@Component({
  selector: 'app-dispatcher-locations-select',
  templateUrl: './dispatcher-locations-select.component.html',
  styles: [
  ]
})
export class DispatcherLocationsSelectComponent {
  points: PointWithAddress[] = [];
  drivers: any[] = [];

  @ViewChild(MapInfoWindow, { static: false }) infoWindow!: MapInfoWindow;
  @ViewChild(GoogleMap, { static: false }) map!: GoogleMap;
  @ViewChild(GooglePlacesComponent, { static: false }) places!: GooglePlacesComponent;

  constructor(
    private messageService: NzMessageService,
    private translate: TranslateService,
    private route: ActivatedRoute,
    private router: Router,
    private dispatcherService: DispatcherService
  ) { }

  getAddress(place: any) {
    this.map.panTo(place.geometry.location);
  }

  removeLastPoint() {
    this.points.pop();
  }

  async mapClicked(event: google.maps.MapMouseEvent) {
    const geocoder = new google.maps.Geocoder();
    const id = this.messageService.loading(this.translate.instant('dispatcher.determiningLocation'), { nzDuration: 0 }).messageId;
    geocoder.geocode({
      location: event.latLng
    }, (results: google.maps.GeocoderResult[] | null, status: google.maps.GeocoderStatus) => {
      if (event.latLng) {
        this.points.push({
          location: event.latLng?.toJSON(),
          address: results![0].formatted_address
        });
        this.messageService.remove(id);
      }

    });
  }

  goToServiceSelection() {
    this.router.navigate(['../service-select'], {
      relativeTo: this.route,
      queryParams: { points: this.dispatcherService.serializePoints(this.points) },
      queryParamsHandling: 'merge'
    });
  }

  centerMap() {
    if (this.drivers.length == 0) {
      this.map.zoom = 1;
      return;
    }
    if (this.drivers.length == 1) {
      this.map.center = this.drivers[0].location;
      this.map.zoom = 16;
      return;
    }
    const latlngbounds = new google.maps.LatLngBounds();
    for (const location of this.drivers) {
      latlngbounds.extend(location.location);
    }
    const placeBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(latlngbounds.getSouthWest().lat() - 2, latlngbounds.getSouthWest().lng() - 2),
      new google.maps.LatLng(latlngbounds.getNorthEast().lat() + 2, latlngbounds.getNorthEast().lng() + 2)
    )
    this.places.setBounds(placeBounds);
    this.map.fitBounds(latlngbounds);
  }

}
