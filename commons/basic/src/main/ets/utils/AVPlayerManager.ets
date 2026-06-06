import { media } from "@kit.MediaKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { PlayerObjectItem, songCardResponse } from "../models";
import { Constants } from "../Constants";

export class AVPlayerManager {
  static AVPlayer?: media.AVPlayer
  static playerObject: PlayerObjectItem = new PlayerObjectItem() // 实例化播放对象

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
        AVPlayerManager.playerObject.duration = duration
      })
      // 监听播放时间
      AVPlayerManager.AVPlayer.on("timeUpdate", (currentTime) => {
        AVPlayerManager.playerObject.time = currentTime
        AppStorage.setOrCreate(Constants.CURRENT_SONG_STORAGE_KEY, AVPlayerManager.playerObject)
      })
    } catch (error) {
      const _error = error as BusinessError // 调用能力可能会出问题 直接打印业务错误码和错误信息
      console.error(`错误码: ${_error.code}, 错误信息: ${_error.message}`)
    }
  }

  static play(currentSongItem: songCardResponse) {
    // 原来的方法只能把当前点击的歌曲去播放 播放器不知道歌曲列表 需要传递整个歌曲对象过来
    try {
      // some(): 检查当前歌曲有没有在播放列表中
      const someSong = AVPlayerManager.playerObject.playList.some(item => item.id == currentSongItem.id)
      if (!!someSong && !!AVPlayerManager.AVPlayer) {
        // 通过判断当前传入的歌曲是否是当前播放的歌曲
        if (AVPlayerManager.playerObject?.url == currentSongItem.url) {
          // 肯定是 就去播放
          AVPlayerManager.AVPlayer.play()
          AVPlayerManager.playerObject.isPlay = true // 存储播放状态: 已经在播放了
        } else {
          // 从播放对象中找到需要播放歌曲的索引
          AVPlayerManager.playerObject.playIndex = AVPlayerManager.playerObject.playList.findIndex(item => item.id == currentSongItem.id)
          // 重新播放 原来的播放方法不能调了
          AVPlayerManager.changePlay()
        }
      } else {
        // 这首歌压根不在播放对象里
        AVPlayerManager.playerObject.playList.unshift(currentSongItem)
        AVPlayerManager.playerObject.playIndex = 0 //回到第一个首歌曲
        AVPlayerManager.changePlay() // 重新播放
      }
      // 还需要将当前播放歌曲信息保存到全局
      AppStorage.setOrCreate(Constants.CURRENT_SONG_STORAGE_KEY, currentSongItem)
    } catch (error) {
      const _error = error as BusinessError // 调用能力可能会出问题 直接打印业务错误码和错误信息
      console.error(`错误码: ${_error.code}, 错误信息: ${_error.message}`)
    }
  }

  static async changePlay() {
    try {
      if (!!AVPlayerManager.AVPlayer) {
        // 需要去重新播放 通过更新索引来更新播放对象并设置播放目标链接
        await AVPlayerManager.AVPlayer.reset() // 这是一个异步方法
        // 给对象里的每一项字段 与传入的歌曲进行匹配 重新赋值
        AVPlayerManager.playerObject.img = AVPlayerManager.playerObject.playList[AVPlayerManager.playerObject.playIndex].img
        AVPlayerManager.playerObject.name = AVPlayerManager.playerObject.playList[AVPlayerManager.playerObject.playIndex].name
        AVPlayerManager.playerObject.author = AVPlayerManager.playerObject.playList[AVPlayerManager.playerObject.playIndex].author
        AVPlayerManager.playerObject.url = AVPlayerManager.playerObject.playList[AVPlayerManager.playerObject.playIndex].url
        AVPlayerManager.AVPlayer.url = AVPlayerManager.playerObject.url
        AVPlayerManager.playerObject.duration = 0
        AVPlayerManager.playerObject.time = 0 // 从头开始
      }
    } catch (error) {
      const _error = error as BusinessError // 调用能力可能会出问题 直接打印业务错误码和错误信息
      console.error(`错误码: ${_error.code}, 错误信息: ${_error.message}`)
    }

  }
}