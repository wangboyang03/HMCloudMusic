import { TabBarItem } from 'basic'

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
            Text(item.label)
          }.tabBar(this.tabBarBuilder(item))
        })
      }.onChange((index) => {
        this.activatedIcon = this.tabBarData[index].name
      })
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