import { songCardResponse } from "basic"

export interface momentListResponse {
  author: string // 发布者
  avatar: string // 头像
  content: string // 内容
  comment: number // 评论数
  like: number // 点赞数
  song: songCardResponse // 音乐卡片
}

