import { TabBarItem } from 'basic'
import Find from 'find/src/main/ets/views/Find'
import Homepage from 'homepage/src/main/ets/views/Homepage'
import Mine from 'mine/src/main/ets/views/Mine'
import Moment from 'moment/src/main/ets/views/Moment'

@Entry
@Component
struct Index {
  tabBarData: TabBarItem[] = [
    {label: '首页', icon: $r('app.media.ic_recommend'), name: 'homepage'},
    {label: '发现', icon: $r('app.media.ic_find'), name: 'find'},
    {label: '动态', icon: $r('app.media.ic_moment'), name: 'moment'},
    {label: '我的', icon: $r('app.media.ic_mine'), name: 'mine'}
  ]
  @State activatedIcon: string = 'homepage'

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End}) {
        ForEach(this.tabBarData, (item: TabBarItem, _: number)=> {
          TabContent() {
            if (item.name == 'homepage') {
              Homepage()
            } else if (item.name == 'find') {
              Find()
            } else if (item.name == 'moment') {
              Moment()
            } else {
              Mine()
            }
          }.tabBar(this.tabBarBuilder(item))
          .backgroundColor($r("[basic].color.tab_bar_background"))
        })
      }.onChange((index) => {
        this.activatedIcon = this.tabBarData[index].name
      })
      .backgroundColor($r("[basic].color.index_background"))
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 创建TabBarItem
   */
  @Builder tabBarBuilder(item: TabBarItem) {
    Column({space: 6}) {
      Image(item.icon)
        .width(22)
        .fillColor(this.activatedIcon == item.name ? $r("[basic].color.selected_black_pink") : $r("[basic].color.unselected_gray"))
      Text(item.label)
        .fontSize(12)
        .fontColor(this.activatedIcon == item.name ? $r("[basic].color.selected_black_pink") : $r("[basic].color.unselected_gray"))
    }
  }
}