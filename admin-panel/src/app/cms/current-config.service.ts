import { Injectable } from "@angular/core";
import { CurrentConfigurationGQL, CurrentConfigurationQuery } from "@ridy/admin-panel/generated/graphql";
import { firstValueFrom } from "rxjs";

@Injectable({
    providedIn: 'root'
})
export class CurrentConfigService {
    currentConfig?: CurrentConfigurationQuery;

    constructor(
        private currentConfigGql: CurrentConfigurationGQL) {}
        
    async getConfig(): Promise<CurrentConfigurationQuery> {
        if(this.currentConfig != null) {
            return this.currentConfig;
        }
        this.currentConfig = (await firstValueFrom(this.currentConfigGql.fetch({}))).data;
        return this.currentConfig;

    }
}