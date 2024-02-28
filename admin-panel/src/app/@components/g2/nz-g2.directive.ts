
import { AfterViewInit, Directive, ElementRef, EventEmitter, Input, NgZone, Output } from '@angular/core';
import { Chart } from '@antv/g2';
import { ChartCfg } from '@antv/g2/lib/interface';
import { inNextTick } from 'ng-zorro-antd/core/util';

 @Directive({
   selector: 'div[nzG2], div[nz-g2]',
   exportAs: 'nzG2',
   host: {
     '[class.ant-g2]': 'true'
   }
 })
 export class NzG2Directive implements AfterViewInit {
   @Input() nzChartOptions!: Partial<ChartCfg>;

   @Output() readonly nzChartInitialized = new EventEmitter<Chart>();

   chartInstance!: Chart;

   private el: HTMLDivElement;

   constructor(elementRef: ElementRef, private ngZone: NgZone) {
     this.el = elementRef.nativeElement;
   }

   ngAfterViewInit(): void {
     inNextTick().subscribe(() => {
       this.createChartInstance();
     });
   }

   private createChartInstance(): void {
     this.ngZone.runOutsideAngular(() => {
       this.chartInstance = new Chart({
         container: this.el,
         autoFit: true,
         ...this.nzChartOptions
       });
       setTimeout(() => {
         this.chartInstance.forceFit();
       }, 350);
      
       this.nzChartInitialized.next(this.chartInstance);
     });
   }
 }