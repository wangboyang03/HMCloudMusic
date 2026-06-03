@Component
export struct RecommendItem {
  @Prop img: ResourceStr
  @Prop title: string
  @Prop type: string
  @Prop top: ResourceColor
  @Prop bottom: ResourceColor

  build() {
    Column() {
      Text(this.type)
        .width('100%')
        .fontSize(14)
        .fontColor($r('[basic].color.label_color'))
        .backgroundColor(this.top)
        .padding(10)
      Image(this.img)
        .draggable(false) // 避免唤起小艺拖拽识别
        .width('100%')
        .aspectRatio(1)
      Text(this.title)
        .width('100%')
        .fontSize(14)
        .fontColor($r('[basic].color.label_color'))
        .backgroundColor(this.bottom)
        .padding(10)
        .lineHeight(20)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis }) // 限定最大行数 超出自动裁剪
    }
    .width('40%')
    .borderRadius(10)
    .clip(true)
  }
}