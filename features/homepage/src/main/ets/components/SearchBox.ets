import { Constants } from 'basic';

@Component
export struct SearchBox {
  @Prop placeholders: string[] = [
    "只",
    "只因",
    "只因你",
    "只因你太",
    "只因你太美",
    "只因你太美🔥"
  ];
  @State currentIndex: number = 0; // 当前显示的索引
  timer: number = -1

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Row() {
      // 外层
      Row() {
        // 搜索图标
        Image($r('app.media.ic_search'))
          .width(20)
          .fillColor('#7e7e7c')
        // 提示词
        Text(this.placeholders[this.currentIndex])
          .padding({left: 3, top: 0, bottom: 0, right: 0})
          .fontColor('#7e7e7c')
          .layoutWeight(1)
          .transition({ type: TransitionType.Insert, opacity: 0 })
          .animation({ duration: 300, curve: Curve.EaseInOut })
        // 扫一扫
        Image($r('app.media.ic_code'))
          .width(22)
          .fillColor('#7e7e7c')
      }
      .width('100%')
      .backgroundColor('#2d2b29')
      .borderRadius(20)
      .height(35)
      .padding({left: 8, right: 8})
    }
    .width('100%')
    .padding({top: 15, bottom: 10, left: 8, right: 8})
    .onAppear(() => {
      this.timer = setInterval(() => {
        this.currentIndex = (this.currentIndex + 1) % this.placeholders.length;
      }, Constants.INTERVAL_TIME)
    })
  }
}