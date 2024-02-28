import es from '@angular/common/locales/es';
import { registerLocaleData } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import {
  ar_EG,
  de_DE,
  en_US,
  es_ES,
  fr_FR,
  hy_AM,
  ja_JP,
  ko_KR,
  NzI18nService,
  pt_PT,
  ru_RU,
  sv_SE,
  zh_CN,
} from 'ng-zorro-antd/i18n';
import { Router } from '@angular/router';
import { CurrentConfigService } from './cms/current-config.service';

@Component({
  selector: 'app-root',
  template: '<router-outlet *ngIf="isLoaded"></router-outlet>',
})
export class AppComponent implements OnInit {
  isDarkMode = false;
  isCollapsed = false;
  isLoaded = false;

  constructor(
    public translate: TranslateService,
    private i18n: NzI18nService,
    private currentConfigService: CurrentConfigService,
    private router: Router
  ) {
    translate.setDefaultLang('en');
    if (localStorage.getItem('lang') != null) {
      translate.use(localStorage.getItem('lang') ?? 'en');
      switch (localStorage.getItem('lang')) {
        case 'en':
          this.i18n.setLocale(en_US);
          break;
        case 'es':
          this.i18n.setLocale(es_ES);
          registerLocaleData(es);
          break;
        case 'fr':
          this.i18n.setLocale(fr_FR);
          break;
        case 'de':
          this.i18n.setLocale(de_DE);
          break;
        case 'sv':
          this.i18n.setLocale(sv_SE);
          break;
        case 'ar':
          this.i18n.setLocale(ar_EG);
          break;
        case 'hy':
          this.i18n.setLocale(hy_AM);
          break;
        case 'ko':
          this.i18n.setLocale(ko_KR);
          break;
        case 'ru':
          this.i18n.setLocale(ru_RU);
          break;
        case 'zh':
          this.i18n.setLocale(zh_CN);
          break;
        case 'ja':
          this.i18n.setLocale(ja_JP);
          break;
        case 'pt':
          this.i18n.setLocale(pt_PT);
          break;
      }
    }
  }

  ngOnInit(): void {
    if (
      window.matchMedia &&
      window.matchMedia('(prefers-color-scheme: dark)').matches
    ) {
      //this.changeTheme();
    }
    this.loadConfiguration();
  }

  async loadConfiguration() {
    const currentConfig = await this.currentConfigService.getConfig();
    if (currentConfig.currentConfiguration.adminPanelAPIKey != null) {
      await this.loadScript(
        `https://maps.googleapis.com/maps/api/js?key=${currentConfig.currentConfiguration.adminPanelAPIKey}&libraries=drawing,places&callback=initMap`
      );
      this.isLoaded = true;
    } else if (
      currentConfig.currentConfiguration.firebaseProjectPrivateKey == null
    ) {
      this.router.navigateByUrl('config');
      this.isLoaded = true;
    }
  }

  loadScript(name: string) {
    return new Promise<void>((resolve, reject) => {
      const script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = name;
      (window as unknown as any).initMap = (ev: any) => {
        resolve();
      };
      document.getElementsByTagName('head')[0].appendChild(script);
    });
  }

  changeTheme(): void {
    // this.isDarkMode = !this.isDarkMode;
    // if (this.isDarkMode) {
    //   const head = document.head || document.getElementsByTagName('head')[0];
    //   const style = document.createElement('link');
    //   style.type = 'text/css';
    //   style.rel = 'stylesheet';
    //   style.id = 'dark-theme';
    //   style.href = '/theme.dark.css';
    //   head.appendChild(style);
    // } else {
    //   const dom = document.getElementById('dark-theme');
    //   if (dom) {
    //     dom.remove();
    //   }
    // }
  }
}
