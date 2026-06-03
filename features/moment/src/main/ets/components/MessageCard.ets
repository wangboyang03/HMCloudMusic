import { OptionsItem } from "./OptionsItem"

@Component
export struct MessageCard {
  @Prop avatar: ResourceStr
  @Prop author: string
  @Prop content: string
  @Prop likeNumber: number
  @Prop commentNumber: number
  @BuilderParam songCardBuilder: () => void = this.insertBuilder

  build() {
    Row({space: 10}) {
      Image(this.avatar)
        .borderRadius(40)
        .width(40)
      // 左 圆形头像 右整体垂直布局
      Column({space: 8}) {
        Text(this.author)
          .width('100%')
          .fontSize(16)
          .fontWeight(500)
          .fontColor($r('[basic].color.label_color'))
        Text(this.content)
          .width('100%')
          .fontSize(14)
          .fontWeight(400)
          .fontColor($r('[basic].color.song_card_author_label_color'))

        this.songCardBuilder() // 歌曲卡片

        Row({space: 14}) {
          OptionsItem({
            leftIcon: $r('app.media.ic_share'),
            label: '分享',
            onClickFunction: () => {}
          })
          OptionsItem({
            leftIcon: $r('app.media.ic_comment_o'),
            label: this.commentNumber.toString(),
            onClickFunction: () => {}
          })
          OptionsItem({
            leftIcon: $r('app.media.ic_like'),
            label: this.likeNumber.toString(),
            onClickFunction: () => {}
          })
        }
      }
      .layoutWeight(1) // 占满全部空间 避免卡片超出位置
      .alignItems(HorizontalAlign.Start) // 从主轴起始点对其排列
    }
    .width('100%')
    // .padding(20)
    .padding({
      top: 20,
      bottom: 20
    })
    .alignItems(VerticalAlign.Top)
    .border({
      width: {
        bottom: 1
      },
      color: $r('[basic].color.message_line_color')
    })
  }

  @Builder insertBuilder() {}
}