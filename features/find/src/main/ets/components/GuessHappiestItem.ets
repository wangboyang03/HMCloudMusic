@Component
export struct GuessHappiestItem {
  @Prop img: ResourceStr
  @Prop name: string
  @Prop isShowPaid: boolean
  @Prop author:  string
  @Prop isShowRightButton: boolean = true
  rightButtonClick?: () => void // 预留口子

  build() {
    Row() {
      // 左中右结构
      Row({space: 10}) {
        Image(this.img)
          .width(100)
          .borderRadius(10)
        Column({space: 15}) {
          Text(this.name) // 歌名
            .width('100%')
            .fontSize(14)
            .fontWeight(500)
            .fontColor($r('[basic].color.label_color'))

          Row({space: 5}) {
            // 收费标志
            Text("VIP") // 接口没有收费标识图 暂时写死
              .width(28)
              .fontSize(10)
              .fontColor($r('[basic].color.paid_label_color'))
              .border({
                width: 0.8,
                color: $r('[basic].color.paid_label_color'),
                radius: 10
              })
              .padding(5)
            // 歌单作者
            Text(this.author)
              .fontSize(13)
              .fontWeight(300)
              .fontColor($r('[basic].color.author_label_color'))
          }
          .width('100%')
        }
        .layoutWeight(1) // 占满剩余空间
        if (this.isShowRightButton) {
          Image($r('app.media.ic_more'))
            .width(18)
            .fillColor($r('[basic].color.label_color'))
            .onClick(() => this.rightButtonClick?.())
        }
      }
      .width('100%')
      .margin({
        bottom: 12
      })
    }
  }
}