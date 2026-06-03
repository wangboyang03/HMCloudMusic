import { BackgroundImage } from "../components"

@Component
export default struct Mine {
  build() {
    Column() {
      // 背景组件
      BackgroundImage()
      // 信息组件
    }
    .width('100%')
  }
}