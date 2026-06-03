@Preview
@Component
export struct SongCard {
  @Prop img: ResourceStr
  @Prop name: string
  @Prop author: string
  // ...其他
  singlePlayClick?:() => void

  build() {
    Row() {
      Image(this.img)
        .width(80)
        .aspectRatio(1)

      // 歌曲名 歌手
      Column({space: 5}) {
        Text(this.name)
          .fontSize(14)
          .fontWeight(500)
          .fontColor($r('[basic].color.song_card_label_color'))
        Text(this.author)
          .fontSize(12)
          .fontWeight(400)
          .fontColor($r('[basic].color.song_card_author_label_color'))
      }
      .height(65)
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(10)

      // 单曲播放
      Image($r('app.media.ic_single_play'))
        .width(26)
        .fillColor($r('[basic].color.song_card_label_color'))
        .margin(10)
        .onClick(() => this.singlePlayClick?.())
    }
    .width('100%')
    .backgroundColor($r('[basic].color.song_card_background_color'))
    .borderRadius(10)
    .clip(true)
  }
}