import { AVPlayerManager, Constants, PlayerObjectItem, songCardResponse } from 'basic'

@Entry
@Component
struct PlayPage {
  songs: songCardResponse[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
      name: '直到世界的尽头',
      author: 'WANDS',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
      id: '0000'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
      name: '画',
      author: '赵磊',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
      id: '0001'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
      name: 'Sweet Dreams',
      author: 'TPaul Sax / Eurythmics',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
      id: '0002'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
      name: '奢香夫人',
      author: '凤凰传奇',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
      id: '0003'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
      name: '空心',
      author: '光泽',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
      id: '0004'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
      name: '反转地球',
      author: '潘玮柏',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
      id: '0005'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
      name: 'No.9',
      author: 'T-ara',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
      id: '0006'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
      name: '孤独',
      author: 'G.E.M.邓紫棋',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
      id: '0007'
    },

    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
      name: 'Lose Control',
      author: 'Hedley',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
      id: '0008'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
      name: '倩女幽魂',
      author: '张国荣',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
      id: '0009'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
      name: '北京北京',
      author: '汪峰',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
      id: '0010'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
      name: '苦笑',
      author: '汪苏泷',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
      id: '0011'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
      name: '一生所爱',
      author: '卢冠廷 / 莫文蔚',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
      id: '0012'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
      name: '月半小夜曲',
      author: '李克勤',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
      id: '0013'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
      name: 'Rolling in the Deep',
      author: 'Adele',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
      id: '0014'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
      name: '海阔天空',
      author: 'Beyond',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
      id: '0015'
    }
  ] // 歌曲列表
  @State playerProgress: number = 0 // 播放进度
  // @State playState: songCardResponse = this.songs[0] // 当前播放的歌曲
  @StorageProp(Constants.CURRENT_SONG_STORAGE_KEY) playState: PlayerObjectItem = new PlayerObjectItem()

  build() {
    // 层叠布局
    Stack() {
      Image(this.playState.img) // 背景图
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Fill)
        .foregroundBlurStyle(BlurStyle.BACKGROUND_THIN,
          {
            colorMode: ThemeColorMode.LIGHT,
            adaptiveColor: AdaptiveColor.DEFAULT,
            scale: 1.0
          })
      // 主体
      Column() {
        // 唱片上部分
        Column() {
          // 唱片嵌套层
          Stack({alignContent: Alignment.Top}) {
            Row() {
              Row() {
                Image(this.playState.img)
                  .width('70%')
                  .borderRadius('100%')
              }
              .width('75%')
              .aspectRatio(1)
              .clip(true)
              .backgroundImage($r('app.media.ic_cd')) // daringSong
              .backgroundImageSize(ImageSize.Cover) // 背景填充模式
              .justifyContent(FlexAlign.Center)
            }
            .width('80%')
            .aspectRatio(1)
            .margin({top: 50})
            .justifyContent(FlexAlign.Center)

            // 顶部
            Image($r('app.media.ic_stylus')) // 原图垂直向下
              .width('50%')
              .aspectRatio(1)
              .rotate({
                angle: -60,
                centerX: 100,
                centerY: 55
              })
          }
          // 标题
          Column({space: 8}) {
            Text(this.playState.name)
              .fontSize(26)
              .fontWeight(600)
              .fontColor($r('[basic].color.song_card_label_color'))
            Text(this.playState.author)
              .fontSize(16)
              .fontColor($r('[basic].color.song_card_label_color'))
          }
        }
        .width('100%')
        .layoutWeight(1)

        /** 添加一个滚动歌词区域 **/

        // 中控区域
        Row() {
          // 收藏
          Badge({ value: '99+', style: { badgeSize: 12, badgeColor: '#45CCCCCC', borderWidth: 0 } }) {
            Image($r("app.media.ic_like"))
              .fillColor(Color.White)
              .width(24)
          }
          // 评论
          Badge({ value: '10W', style: { badgeSize: 12, badgeColor: '#45cccccc', borderWidth: 0 } }) {
            Image($r("app.media.ic_comment_o"))
              .fillColor(Color.White)
              .width(18)
          }
          // 彩铃
          Badge({ value: 'hot', style: { badgeSize: 12, badgeColor: '#a8ff3131', borderWidth: 0 } }) {
            Image($r("app.media.ic_bells_o"))
              .fillColor(Color.White)
              .width(24)
          }
          // 下载
          Badge({ value: 'vip', style: { badgeSize: 12, badgeColor: '#b7efd371', borderWidth: 0 } }) {
            Image($r("app.media.ic_download_o"))
              .fillColor(Color.White)
              .width(24)
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        // 进度条
        Row({space: 4}) {
          Text("00:00")
            .fontSize(12)
            .fontColor(Color.White)
          Slider({
            value: this.playState.time,
            min: 0,
            max: this.playState.duration
          })
            .layoutWeight(1)
            .blockColor(Color.White)
            .selectedColor(Color.White)
            .trackColor('#ccc5c5c5')
            .trackThickness(2)
            .onChange((value) => {
              AVPlayerManager.AVPlayer?.seek(value)
            })
          Text("00:00")
            .fontSize(12)
            .fontColor(Color.White)
        }
        .width('100%')
        // 下控区域
        Row() {
          // 切换列表循环模式
          Image($r('app.media.ic_auto'))
            .fillColor(Color.White)
            .width(30)
          // 上一曲
          Image($r("app.media.ic_prev"))
            .fillColor(Color.White)
            .width(30)
          // 播放按钮
          Image($r('app.media.ic_paused'))
            .fillColor(Color.White)
            .width(50)
          // 下一首
          Image($r('app.media.ic_next'))
            .fillColor(Color.White)
            .width(30)
          // 播放列表
          Image($r('app.media.ic_song_list'))
            .fillColor(Color.White)
            .width(30)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .padding({
          bottom: 20 // 安全区避让
        })
      }
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}