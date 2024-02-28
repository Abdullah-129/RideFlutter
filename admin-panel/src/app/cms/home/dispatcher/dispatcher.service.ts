import { Injectable } from "@angular/core";
import { PointWithAddress } from "../../../@models/coordinatexy";

@Injectable()
export class DispatcherService {
    serializePoints(points: PointWithAddress[]): string {
        return points.map(point => `${point.location.lat}|${point.location.lng}|${point.address}`).join('_');
    }

    deserializePoints(string: string): PointWithAddress[] {
        return string.split('_').map(point => ({location: {lat: parseFloat(point.split('|')[0]), lng: parseFloat(point.split('|')[1])}, address: point.split('|')[2]}))
    }
}