import { SearchBox } from "../components"

@Component
export default struct Homepage {
  @State swiperImageList: string[] = [
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png"
  ]
  build() {
    Column() {
      // 顶部搜索条（文字轮播+扫码组件）
      SearchBox()
      // 中部轮播图
      this.SwiperImageBuilder(this.swiperImageList)
      // 每日推荐

      // 推荐歌单
    }
    .width('100%')
    .height('100%')
  }
  
  // 轮播图
  @Builder SwiperImageBuilder(itemList: string[]) {
    Swiper() {
      ForEach(itemList, (item: string, index: number) => {
        Image(item)
          .width('100%')
          .height(200)
          .borderRadius(20)
      })
    }
    .onChange((index: number) => {})
    .autoPlay(true)
    .padding(10)
  }
}