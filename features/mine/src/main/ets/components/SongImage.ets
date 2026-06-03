import { songCardResponse, songItemDataModel } from "basic";

@Component
export struct SongImage {
  @Prop songImage: ResourceStr

  build() {
    Image(this.songImage)
      .width('100%')
      .aspectRatio(1)
      .borderRadius(10)
  }
}