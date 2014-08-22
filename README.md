#MoviePlayerViewController

iOS 下的自定义视频播放器，功能

* 支持手势快进/快退
* 支持手势调节亮度/音量
* 记住播放进度
* 可以播放网络 m3u8 视频
* 可以播放本地 mp4 视频
* 支持本地分段 mp4 视频的连续播放

## 使用

* 播放本地 mp4

```
NSURL *url = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp4"];
MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initLocalMoviePlayerViewControllerWithURL:url movieTitle:@"电影名称1"];
[self presentViewController:movieVC animated:YES completion:nil];
```

* 播放网络 m3u8

```
NSURL *url = [NSURL URLWithString:@"http://v.youku.com/player/getRealM3U8/vid/XMjE4MDU1MDE2/type/mp4/v.m3u8"];
MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initNetworkMoviePlayerViewControllerWithURL:url movieTitle:@"电影名称2"];
movieVC.datasource = self;
[self presentViewController:movieVC animated:YES completion:nil];
```

* 播放分段 mp4

```
NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp4"];
NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"mp4"];
NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"3" withExtension:@"mp4"];
NSArray *list = @[url1,url2,url3];
MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initLocalMoviePlayerViewControllerWithURLList:list movieTitle:@"电影名称3"];
[self presentViewController:movieVC animated:YES completion:nil];
```

## License | 许可

This code is distributed under the terms of the [GNU General Public License](http://www.gnu.org/licenses/gpl.html).

代码使用 [GNU General Public License](http://www.gnu.org/licenses/gpl.html) 许可发布.
