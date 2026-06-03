@Component
export struct PlaylistItem {
  @Prop count: string
  @Prop title: string
  @Prop img: ResourceStr

  build() {
    Column({space: 8}) {
      Stack() {
        // 图片+数量
        Image(this.img)
          .draggable(false) // 避免唤起小艺拖拽识别
          .width('100%')
          .aspectRatio(1)
          .borderRadius(12)

        Text(this.count)
          .width('100%')
          .margin(8)
          .fontSize(14)
          .fontWeight(600)
          .fontColor($r('[basic].color.label_color'))
          .position({left: 0, top: 0})
      }
      // 标题
      Text(this.title)
        .width('100%')
        .fontSize(14)
        .fontColor($r('[basic].color.label_color'))
        .lineHeight(20)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis }) // 限定最大行数 超出自动裁剪
    }
    .width('40%')
  }
}