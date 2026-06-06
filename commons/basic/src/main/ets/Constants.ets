export class Constants {
  static readonly SPLASH_COUNTDOWN = 5
  static readonly INTERVAL_TIME = 1500
  static readonly BUNDLE_NAME = "com.itheima.harmony_cloud_music"
  static readonly HOMEPAGE_MODULE = "homepage"
  static readonly PHONE_MODULE = "phone"

  // 路由相关
  static readonly SPLASH_SCREEN = `@bundle:${Constants.BUNDLE_NAME}/${Constants.HOMEPAGE_MODULE}/ets/pages/SplashScreen`
  static readonly INDEX_PAGE = `@bundle:${Constants.BUNDLE_NAME}/${Constants.PHONE_MODULE}/ets/pages/Index`
  static readonly PLAY_PAGE = `@bundle:${Constants.BUNDLE_NAME}/${Constants.HOMEPAGE_MODULE}/ets/pages/PlayPage`
}