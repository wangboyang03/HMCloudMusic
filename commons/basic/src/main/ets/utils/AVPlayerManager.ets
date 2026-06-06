import { media } from "@kit.MediaKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { PlayerObjectItem } from "../models";

export class AVPlayerManager {
  static AVPlayer?: media.AVPlayer
  static PlayerObject: PlayerObjectItem = new PlayerObjectItem() // 实例化播放对象

  static async init() {
    try {
      if (!AVPlayerManager.AVPlayer) {
        AVPlayerManager.AVPlayer = await media.createAVPlayer(); // Promise<media.AVPlayer>
      }
      // 监听播放器状态 stateChange
      AVPlayerManager.AVPlayer.on("stateChange", (state) => {
        if (state == "initialized") {
          // 初始化完毕
          AVPlayerManager.AVPlayer?.prepare()
        } else if (state == "prepared") {
          // 准备完毕 可以开始播放了
          AVPlayerManager.AVPlayer?.play()
        }
      })

      // 监听播放对象更新
      AVPlayerManager.AVPlayer.on("durationUpdate", (duration) => {
        AVPlayerManager.PlayerObject.duration = duration
      })
      // 监听播放时间
      AVPlayerManager.AVPlayer.on("timeUpdate", (currentTime) => {
        AVPlayerManager.PlayerObject.time = currentTime
      })
    } catch (error) {
      const _error = error as BusinessError // 调用能力可能会出问题 直接打印业务错误码和错误信息
      console.error(`错误码: ${_error.code}, 错误信息: ${_error.message}`)
    }
  }

  static play(url: string) {
    if (!!AVPlayerManager.AVPlayer) {
      AVPlayerManager.AVPlayer.url = url
    }
  }
}