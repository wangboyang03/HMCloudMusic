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