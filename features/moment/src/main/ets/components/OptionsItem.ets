@Component
export struct OptionsItem {
  @Prop leftIcon: ResourceStr
  @Prop label: string
  onClickFunction?: () => void

  build() {
    Row({space: 3}) {
      Image(this.leftIcon)
        .width(22)
        .fillColor($r('[basic].color.options_icon_color'))
      Text(this.label)
        .fontSize(14)
        .fontColor($r('[basic].color.options_label_color'))
    }.onClick(() => this.onClickFunction?.())
  }
}