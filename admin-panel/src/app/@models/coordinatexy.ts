

export default class CoordinateXY {
    x!: number;
    y!: number;
}

export class Coordinate {
    lat!: number;
    lng!: number;
}


export type PointWithAddress = {
    location: Coordinate,
    address: string
}