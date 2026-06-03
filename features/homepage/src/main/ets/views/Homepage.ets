import { RecommendItem, SearchBox, PlaylistItem } from "../components"
import { PlaylistItemResponse, RecommendItemResponse } from "../models"

@Component
export default struct Homepage {
  @State swiperImageList: string[] = [
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png"
  ]
  // 每日推荐数据
  @State dailyRecommend: RecommendItemResponse[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend1.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '每日推荐',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend2.png',
      title: '从 [Nothing on Me] 开启无限漫游',
      type: '私人漫游',
      top: '#382e2f',
      bottom: '#a37862'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend3.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '华语流行',
      top: '#a37862',
      bottom: '#174847'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend4.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '私人雷达',
      top: '#174847',
      bottom: '#174847'
    }
  ]
  @State playlistRecommend: PlaylistItemResponse[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list1.jpg',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      count: '270.9万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list2.jpg',
      title: 'Yasuo和更多好听的 | 华语私人雷达 | 回忆8090',
      count: '476.1万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list3.jpg',
      title: 'Trap Remix丨当欧美热单遇上毒性低音',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list4.jpg',
      title: '满级人类进化之路必备BGM | 根本停不下来',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list5.jpg',
      title: '认真去聆听这个世界的每一分每一秒 (强烈推荐)',
      count: '362.8万'
    }
  ]

  build() {
    Column() {
      // 顶部搜索条（文字轮播+扫码组件）
      SearchBox()
      Scroll() {
        Column() {
          // 中部轮播图
          this.SwiperImageBuilder(this.swiperImageList)

          // 每日推荐
          this.TitleBuilder('每日推荐', $r('app.media.ic_more'))
          Scroll() {
            Row({space:8}) {
              ForEach(this.dailyRecommend, (item: RecommendItemResponse, _: number) => {
                RecommendItem({
                  title: item.title,
                  img: item.img,
                  type: item.type,
                  top: item.top,
                  bottom: item.bottom
                })
              })
            }
          }
          .width('100%')
          .padding(8)
          .scrollable(ScrollDirection.Horizontal)
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)

          // 推荐歌单
          this.TitleBuilder('推荐歌单', $r('app.media.ic_more'))
          Scroll() {
            Row({space:8}) {
              ForEach(this.playlistRecommend, (item: PlaylistItemResponse, _: number) => {
                PlaylistItem({
                  count: item.count,
                  img: item.img,
                  title: item.title
                })
              })
            }
          }
          .width('100%')
          .scrollable(ScrollDirection.Horizontal)
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
          .padding(10)

          Column().height(30) // 占位
        }
        .constraintSize({ minHeight: '100%' })
      }
      .layoutWeight(1)
      .scrollable(ScrollDirection.Vertical) // 垂直滚动
      .scrollBar(BarState.Off) // 隐藏滚动条
    }
    .width('100%')
    .height('100%')
  }
  
  // 轮播图
  @Builder SwiperImageBuilder(itemList: string[]) {
    Swiper() {
      ForEach(itemList, (item: string, index: number) => {
        Image(item)
          .draggable(false) // 避免唤起小艺拖拽识别
          .width('100%')
          .height(200)
          .borderRadius(20)
      })
    }
    .onChange((index: number) => {})
    .autoPlay(true)
    .padding(10)
  }

  // 中部瓷片区标题
  @Builder TitleBuilder(title: string, rightIcon?: ResourceStr) {
    Row() {
      Text(title)
        .fontColor($r('[basic].color.label_color'))
        .fontWeight(700)
      if (!!rightIcon) {
        Image(rightIcon)
          .draggable(false) // 避免唤起小艺拖拽识别
          .width(22)
          .fillColor($r('[basic].color.label_color'))
      }
    }
    .width('100%')
    .padding(8)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}