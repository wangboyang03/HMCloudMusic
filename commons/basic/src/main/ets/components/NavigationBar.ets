@Component
export struct NavigationBar {
  @Prop label: string
  @Prop rightIcon: ResourceStr

  build() {
    Row() {
      Text(this.label)
        .width('100%')
        .fontSize(16)
        .fontWeight(500)
        .fontColor($r('[basic].color.label_color'))
        .margin({
          top: 10,
          bottom: 10
        })
    }
  }
}