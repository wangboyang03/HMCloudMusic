export interface momentListResponse {
  author: string // 发布者
  avatar: string // 头像
  content: string // 内容
  comment: number // 评论数
  like: number // 点赞数
  song: songCardResponse // 音乐卡片
}

export interface songCardResponse {
  img: string // 封面
  name: string // 歌曲名
  author: string // 作者
  url: string // 播放链接
  id: string // id
}