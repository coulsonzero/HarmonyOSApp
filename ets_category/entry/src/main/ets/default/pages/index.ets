export const mListItem: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9,]

export const mState: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9,]

export const mGridItem: number[] = [1, 2, 3, 4,]

export const mListChild: number[] = [1, 2, 3, 4, 5, 6,]

export const mChildItem: number[] = [1, 2, 3, 4, 5, 6,]

export const mTabList: number[] = [1, 2, 3, 4,]

export const white: string = "#ffffff"

export const black: string = "#000000"

@Entry
@Component
struct CategoryPage {
  build() {
    Column() {
      TitleBar()
      Row() {
        CategoryList({
          listItem: mListItem,
        })
      }
      .height('93%')
      .layoutWeight(1)

      Row() {
        TabBar({
          tabList: mTabList
        })
      }
      .height('7%')
    }
  }
}

@Component
struct TitleBar {
  build() {
    Column() {
      Text($r('app.string.app_name'))
        .fontColor($r('app.color.text_color'))
        .fontSize("16fp")
        .margin({
          left: "24vp",
          right: "24vp",
          top: "4vp"
        })
      Text($r('app.string.describe'))
        .fontSize("14vp")
        .fontColor($r('app.color.appbar_subtitle_color'))
        .margin({
          left: "24vp",
          right: "24vp",
          top: "4vp",
          bottom: "4vp"
        })
    }
    .width('100%')
    .constraintSize({ minHeight: "56vp" })
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.colorSubBackground'))
  }
}

@Component
struct CategoryList {
  private listItem: number[]
  @State color: string[] = [
    "#ff00ff",
    "#ffffff",
    "#ffffff",
    "#ffffff",
    "#ffffff",
    "#ffffff",
    "#ffffff",
    "#ffffff",
    "#ffffff"
  ]
  private listState: number = 0

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.listItem, (item: number) => {
            ListItem() {
              Column() {
                Text($r('app.string.category', item))
                  .fontSize("16vp")
                  .fontColor($r('app.color.text_color'))
                  .margin({
                    top: "25vp",
                    bottom: "3vp",
                    left: "24vp"
                  })
                Column()
                  .backgroundColor(this.color[item - 1])
                  .height("2vp")
                  .width("60%")
                  .margin({
                    left: "22vp",
                    bottom: "10vp"
                  })
              }.onClick(() => {
                if (this.color[item - 1] == white) {
                  for (var i = 0; i < 9; i++) {
                    if (i == item - 1) {
                      this.color[i] = black
                    } else {
                      this.color[i] = white
                    }
                  }
                }
                this.listState = item - 1;
                console.debug("you click" + this.listState)
              })
            }
          }, item => item.toString())
        }
      }.width('30%')

      Divider()
        .vertical(true)
        .color($r('app.color.text_color'))
        .margin({
          top: "8vp",
          bottom: "8vp"
        })
      Column() {
        Scroll() {
          Column() {
            CategoryItem({
              gridItem: mGridItem,
            })
            CategoryChild({
              listChild: mListChild,
              childItem: mChildItem,
              childState: this.listState
            })
          }
        }
      }.width('70%')
    }
  }
}

@Component
struct CategoryItem {
  private gridItem: number[]

  build() {
    Grid() {
      ForEach(this.gridItem, (item: number) => {
        GridItem() {
          Stack() {
            Text($r('app.string.item', item))
              .fontSize("16vp")
              .margin({
                top: "8vp",
                left: "8vp"
              })
          }
          .width("100vp")
          .height("60vp")
          .alignContent(Alignment.TopStart)
          .borderRadius(12)
          .backgroundColor($r('app.color.appbar_subtitle_color'))
          .onClick(() => {
            console.debug("you click" + item)
          })
        }
      }, item => item.toString())
    }
    .columnsTemplate('1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .height("150vp")
    .margin({
      top: "4vp"
    })
  }
}

@Component
struct CategoryChild {
  private listChild: number[]
  private childItem: number[]
  @State childState: number = 0

  build() {
    Column() {
      ForEach(this.listChild, (item: number) => {
        Column() {
          Row() {
            Column() {
              Text($r('app.string.itemChild', this.childState, item))
                .fontSize("16vp")
                .fontColor($r('app.color.text_color'))
                .margin({
                  left: "12vp",
                  right: "12vp"
                })
            }.width('55%').layoutWeight(1).alignItems(HorizontalAlign.Start)

            Column() {
              Text($r('app.string.more'))
                .fontSize("14vp")
                .fontColor($r('app.color.appbar_subtitle_color'))
                .margin({
                  left: "12vp",
                  right: "12vp"
                })
                .onClick(() => {
                  console.debug("you click more" + this.childState)
                })
            }.width('45%').alignItems(HorizontalAlign.End)
          }
          .width('100%')
          .height("40vp")
          .borderRadius("4vp")
          .backgroundColor($r('app.color.colorSubBackground'))
          .margin({
            top: "12vp",
            left: "12vp",
            right: "12vp"
          })

          GridChild({
            childItem: this.childItem
          })
        }
      }, item => item.toString())
    }
  }
}

@Component
struct GridChild {
  private childItem: number[]

  build() {
    Grid() {
      ForEach(this.childItem, (item: number) => {
        GridItem() {
          Stack() {
            Text($r('app.string.item', item))
              .fontSize("16vp")
          }
          .width("60vp")
          .height("60vp")
          .borderRadius(12)
          .backgroundColor($r('app.color.appbar_subtitle_color'))
          .onClick(() => {
            console.debug("you click" + item)
          })
        }
      }, item => item.toString())
    }
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .height("150vp")
    .margin({
      top: "4vp"
    })
  }
}

@Component
struct TabBar {
  private tabList: number[]
  private off: Resource = $r('app.media.icon_normal')
  private on: Resource = $r('app.media.icon_activated')
  @State src: Resource[] = [
    this.on,
    this.off,
    this.off,
    this.off
  ]

  build() {
    Column() {
      List() {
        ForEach(this.tabList, (item: number) => {
          ListItem() {
            Column() {
              Image(this.src[item - 1])
                .height('60%')
                .width('8%')
                .margin({
                  top: "4vp",
                  bottom: "4vp"
                })
              Text($r('app.string.tab', item))
                .fontSize("9vp")
                .fontColor($r('app.color.text_color'))
                .margin({
                  left: "24vp",
                  right: "24vp"
                })
            }.onClick(() => {
              if (this.src[item - 1] == this.off) {
                for (var i = 0; i < 4; i++) {
                  if (i == item - 1) {
                    this.src[i] = this.on
                  } else {
                    this.src[i] = this.off
                  }
                }
              }
              console.debug("you click" + item)
            })
          }
        }, item => item.toString())
      }
      .listDirection(Axis.Horizontal)
    }
  }
}
