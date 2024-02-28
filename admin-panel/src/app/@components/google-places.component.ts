import { Component, ViewChild, EventEmitter, Output, OnInit, AfterViewInit, Input } from '@angular/core';

@Component({
    selector: 'google-places-autocomplete',
    template: `
      <input class="input"
        type="text"
        nz-input
        [(ngModel)]="autocompleteInput"
        #addresstext style="width: 100%; margin-top:10px; margin-bottom: 10px;"
        >
    `,
})
export class GooglePlacesComponent implements AfterViewInit {
    @Input() adressType!: string;
    @Output() setAddress: EventEmitter<any> = new EventEmitter();
    @ViewChild('addresstext') addresstext: any;

    autocompleteObject!: google.maps.places.Autocomplete;
    autocompleteInput!: string;
    queryWait!: boolean;


    ngAfterViewInit() {
        this.getPlaceAutocomplete();
    }

    private getPlaceAutocomplete() {
        this.autocompleteObject = new google.maps.places.Autocomplete(this.addresstext.nativeElement,
            {
                types: [this.adressType]  // 'establishment' / 'address' / 'geocode',
            });
        google.maps.event.addListener(this.autocompleteObject, 'place_changed', () => {
            const place = this.autocompleteObject.getPlace();
            this.invokeEvent(place);
        });
    }

    setBounds(bounds: google.maps.LatLngBounds) {
        this.autocompleteObject.setBounds(bounds);
    }

    invokeEvent(place: unknown) {
        this.setAddress.emit(place);
    }

}