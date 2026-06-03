import { Constants } from 'basic'

@Entry
@Component
struct SplashScreen {
  // @State message: string = 'Hello World';
  @State countDown: number = Constants.SPLASH_COUNTDOWN
  timer: number = -1 // 定时器句柄

  clearTimerAndRouterPush() {
    clearInterval(this.timer)
    this.getUIContext().getRouter().replaceUrl({url:Constants.INDEX_PAGE})
  }

  build() {
    Stack({alignContent: Alignment.Center}) {
      Image($r("app.media.ad"))

      // 跳过按钮
      Text(`跳过 ${this.countDown}`)
        .width(60)
        .textAlign(TextAlign.Center)
        .margin(20)
        .padding(5)
        .position({top:0,right:0})
        .borderRadius("30%")
        .onClick(() => this.clearTimerAndRouterPush())
        .onAppear(() => {
          this.timer = setInterval(() => {
            if (this.countDown <= 0) {
              this.clearTimerAndRouterPush()
            } else {
              this.countDown--
            }
          }, 1000)
        })
    }
  }
}