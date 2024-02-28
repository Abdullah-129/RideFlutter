import { AfterViewInit, Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { GoogleMap, MapInfoWindow, MapMarker } from '@angular/google-maps';
import { camelCase } from 'camel-case';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { DriverLocationFragment, DriverOverviewInfoFragment, OverviewDriverPagingGQL, OverviewQuery } from '@ridy/admin-panel/generated/graphql';
import { firstValueFrom, map, Observable, Subscription } from 'rxjs';
import { ApolloQueryResult } from '@apollo/client/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-overview-drivers-map',
  templateUrl: './overview-drivers-map.component.html'
})
export class OverviewDriversMapComponent implements OnInit, AfterViewInit, OnDestroy {
  // Table properties
  page = 1;
  total = 1;
  listOfData: DriverOverviewInfoFragment[] = [];
  locations: DriverLocationFragment[] = [];

  // Map properties
  autoZoom = false;
  query?: Observable<ApolloQueryResult<OverviewQuery>>;

  subscription?: Subscription;

  selectedDriverId!: number;
  @ViewChild(MapInfoWindow, { static: false }) infoWindow!: MapInfoWindow;
  @ViewChild(GoogleMap, { static: false }) map!: GoogleMap;

  constructor(
    public tagColor: TagColorService,
    private route: ActivatedRoute,
    private overviewDriversPaging: OverviewDriverPagingGQL) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.overview));
  }

  ngAfterViewInit(): void {
    this.subscription = this.query?.subscribe(data => {
      this.listOfData = data.data.drivers.nodes;
      this.total = data.data.drivers.totalCount;
      this.locations = data.data.getDriversLocation;
      this.centerMap();
    });
  }

  centerMap() {
    if (this.locations.length == 0) {
      this.map.zoom = 1;
      return;
    }
    if (this.locations.length == 1) {
      this.map.panTo(this.locations[0].location);
      return;
    }
    const latlngbounds = new google.maps.LatLngBounds();
    for (const location of this.locations) {
      latlngbounds.extend(location.location);
    }
    this.map.fitBounds(latlngbounds);
  }

  openInfoWindow(marker: MapMarker, driverId: number) {
    this.selectedDriverId = driverId;
    this.infoWindow.open(marker);
  }

  toCamelCase(value: string) {
    return camelCase(value)
  }

  async searchData(): Promise<void> {
    const result = await firstValueFrom(this.overviewDriversPaging.fetch({offset: (this.page - 1) * 5}));
    this.listOfData = result.data.drivers.nodes;
    this.total = result.data.drivers.totalCount;
  }

  showDriverOnMap(id: string) {
    this.map.zoom = 16;
    this.map.panTo(this.locations.filter(x => x.driverId == parseInt(id))[0].location);
  }

  ngOnDestroy(): void {
    this.subscription?.unsubscribe();
  }
}
