import { Component, OnInit, HostBinding } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NzNotificationService } from 'ng-zorro-antd/notification';
import { Stats } from '../@models/stats';
import { mainPageSwitchTransition } from '../@animations/main.animation';
import { registerLocaleData } from '@angular/common';
import es from '@angular/common/locales/es';
import { TranslateService } from '@ngx-translate/core';
import { ar_EG, de_DE, en_US, es_ES, fr_FR, hy_AM, ja_JP, ko_KR, NzI18nService, pt_PT, ru_RU, zh_CN } from 'ng-zorro-antd/i18n';

@Component({
  selector: 'app-cms',
  templateUrl: './cms.component.html',
  styleUrls: ['./cms.component.css'],
  animations: [mainPageSwitchTransition]
})
export class CMSComponent implements OnInit {
  @HostBinding('@mainPageSwitchTransition') state = 'activated';
  isCollapsed = true;
  stats: Stats = new Stats();
  isDarkMode = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private notification: NzNotificationService,
    private translate: TranslateService,
    private i18n: NzI18nService) {
  }

  ngOnInit(): void {
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
      //this.isDarkMode = true;
      this.changeTheme();
    }
    // this.socket.fromEvent('newNotification').subscribe((x: SocketNotification) => {
    //   const title = x.type == 'Complaint' ? 'New Complaint' : (x.type == 'Driver') ? 'Driver Submitted' : 'Payment Requeset';
    //   const message = x.type == 'Complaint' ? 'A Complaint has been made.' : (x.type == 'Driver') ? 'A new Driver has submitted awaiting your approval.' : 'A driver has requested payment.';
    //   this.notification.create(
    //     x.type == 'Complaint' ? 'warning' : 'info',
    //     title,
    //     message
    //   )
    // });
    // this.socket.emit('getStats', null, (result: Stats) => {
    //   this.stats = result;
    // });
    // this.socket.fromEvent('statChanged').subscribe((x: any) => {
    //   this.stats[x.key] += x.value;
    // });
  }

  logout() {
    localStorage.removeItem('ridy_admin_token');
    this.router.navigate(['login'], { relativeTo: this.route.root });
    window.location.reload();
    // const sessionId = localStorage.getItem('sessionId') != null ? parseInt(localStorage.getItem('sessionId') ?? "") : null;
    // this.socket.emit('logout', { sessionId }, (result: number) => {
    //   localStorage.removeItem('ridy_admin_token');
    //   this.router.navigate(['login'], {relativeTo: this.route.root});
    //   window.location.reload();
    // });
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

  changeLanguage(language: string): void {
    this.translate.use(language);
    localStorage.setItem('lang', language);
    switch (language) {
      case ('en'):
        this.i18n.setLocale(en_US);
        break;
      case ('es'):
        this.i18n.setLocale(es_ES);
        registerLocaleData(es);
        break;
      case ('fr'):
        this.i18n.setLocale(fr_FR);
        break;
      case ('de'):
        this.i18n.setLocale(de_DE);
        break;
      case ('ar'):
        this.i18n.setLocale(ar_EG);
        break;
      case ('hy'):
        this.i18n.setLocale(hy_AM);
        break;
      case ('ko'):
        this.i18n.setLocale(ko_KR);
        break;
      case ('ru'):
        this.i18n.setLocale(ru_RU);
        break;
      case ('zh'):
        this.i18n.setLocale(zh_CN);
        break;
      case ('ja'):
        this.i18n.setLocale(ja_JP);
        break;
      case ('pt'):
        this.i18n.setLocale(pt_PT);
        break;
    }
  }
}

// interface SocketNotification {
//   type: 'Complaint' | 'PaymentRequest' | 'Driver';
//   id: number;
// }