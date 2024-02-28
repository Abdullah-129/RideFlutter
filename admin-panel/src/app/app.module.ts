import { BrowserModule, Title } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {TranslateModule, TranslateLoader, TranslateService} from '@ngx-translate/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { ServiceWorkerModule } from '@angular/service-worker';
import { environment } from '../environments/environment';
import { SharedModule } from './@components/shared.module';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { en_US, NZ_I18N } from 'ng-zorro-antd/i18n';
import { GraphQLModule } from './graphql.module';
import { TimeagoModule } from 'ngx-timeago';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { UserOutline, ContainerOutline, CustomerServiceOutline, GlobalOutline, BulbOutline, NotificationOutline, BankOutline, CarOutline, FundOutline, ControlOutline, PlusOutline, DashboardOutline, MenuFoldOutline, LogoutOutline, MenuUnfoldOutline, ArrowLeftOutline, DeleteOutline, PictureTwoTone, ExportOutline, InboxOutline, DownloadOutline, LockOutline, EyeInvisibleOutline, FieldTimeOutline, ScheduleOutline, FolderOpenOutline, AlertOutline } from '@ant-design/icons-angular/icons';
import { IconDefinition } from '@ant-design/icons-angular';
import { ApolloModule } from 'apollo-angular';

const icons: IconDefinition[] = [ UserOutline, ContainerOutline, CustomerServiceOutline, GlobalOutline, BulbOutline, NotificationOutline, BankOutline, CarOutline, FundOutline, ControlOutline, PlusOutline, DashboardOutline, MenuFoldOutline, MenuUnfoldOutline, LogoutOutline, ArrowLeftOutline, DeleteOutline, PictureTwoTone, ExportOutline, InboxOutline, DownloadOutline, LockOutline, EyeInvisibleOutline, FieldTimeOutline, ScheduleOutline, FolderOpenOutline, AlertOutline ];
registerLocaleData(en);

// AoT requires an exported function for factories
export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, 'assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ApolloModule,
    SharedModule,
    HttpClientModule,
    GraphQLModule,
    NzIconModule.forRoot(icons),
    BrowserAnimationsModule,
    TranslateModule.forRoot({
      defaultLanguage: 'en',
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
      }
    ),
    ServiceWorkerModule.register('ngsw-worker.js', { enabled: environment.production }),
    TimeagoModule.forRoot()
  ],
  providers: [
    { provide: NZ_I18N, useValue: en_US }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(private title: Title, private translator: TranslateService) {
    translator.get('branding.page.title').subscribe(x => {
      title.setTitle(x);
    })
  }
 }
