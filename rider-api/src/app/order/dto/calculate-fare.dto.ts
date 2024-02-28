import { ObjectType, registerEnumType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { ServiceCategoryDTO } from "../../service/dto/service-category.dto";

export enum CalculateFareError {
    RegionUnsupported = 'REGION_UNSUPPORTED',
    NoServiceInRegion = 'NO_SERVICE_IN_REGION'
}

registerEnumType(CalculateFareError, { name: 'CalculateFareError' });

@ObjectType()
export class CalculateFareDTO {
    currency: string;
    distance: number;
    duration: number;
    directions: Point[];
    services: ServiceCategoryDTO[];
    error?: CalculateFareError;
}