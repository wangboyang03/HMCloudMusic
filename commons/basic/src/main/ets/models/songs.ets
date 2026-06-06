export interface songCardResponse {
  img: string // 封面
  name: string // 歌曲名
  author: string // 作者
  url: string // 播放链接
  id: string // id
}

export class songItemDataModel implements songCardResponse {
  img: string = ''
  name: string = ''
  author: string = ''
  url: string = ''
  id: string = ''
  constructor(model: songCardResponse) {
    this.img = model.img
    this.name = model.img
    this.author = model.author
    this.url = model.url
    this.id = model.id
  }
}

export class PlayerObjectItem {
  img: string = "" // 音乐封面
  name: string = "" // 音乐名称
  author: string = "" // 作者
  url: string = "" // 当前播放连接
  playIndex: number = 0 // 当前在播放列表中的播放索引
  time: number = 0 // 播放时间
  duration: number = 0 // 音乐的播放时长
  isPlay: boolean = false // 是否正在播放
  playMode: 'auto' | 'repeat' | 'random' = "auto" // 播放模式
  playList: songCardResponse[] = [] // 当前的播放列表
  cacheImg?: string // 缓存图片地址
}