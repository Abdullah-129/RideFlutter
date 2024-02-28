import { IDField, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ServiceDTO } from "./service.dto";

//@UnPagedRelation('services', () => ServiceDTO)
@ObjectType('ServiceCategory')
export class ServiceCategoryDTO {
    @IDField(() => ID)
    id: number;
    name: string;
    services: ServiceDTO[];
}