//
//  MainViewController.m
//  AvPlayerDemo
//
//  Created by pljhonglu on 13-12-13.
//  Copyright (c) 2013年 pljhonglu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
    [button setTitle:@"播放本地视频" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(playLocalMovie) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 150, 320, 30)];
    [button1 setTitle:@"播放网络视频" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(playNetMovie) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 320, 30)];
    [button3 setTitle:@"播放本地分段视频" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(playLocalMovieList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playLocalMovie{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp4"];
    MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initLocalMoviePlayerViewControllerWithURL:url movieTitle:@"电影名称1"];
    [self presentViewController:movieVC animated:YES completion:nil];
}
- (void)playNetMovie{
//    NSURL *url = [NSURL URLWithString:@"http://v.youku.com/player/getRealM3U8/vid/XMjE4MDU1MDE2/type/mp4/v.m3u8"];
    NSURL * url = [NSURL URLWithString:@"http://61.154.14.22:1259/xasp/video/20140110/20140110184826.mp4"];
    MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initNetworkMoviePlayerViewControllerWithURL:url movieTitle:@"电影名称2"];
    movieVC.datasource = self;
    [self presentViewController:movieVC animated:YES completion:nil];
}
- (void)playLocalMovieList{
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp4"];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"mp4"];
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"3" withExtension:@"mp4"];
    NSArray *list = @[url1,url2,url3];
    MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc]initLocalMoviePlayerViewControllerWithURLList:list movieTitle:@"电影名称3"];
    [self presentViewController:movieVC animated:YES completion:nil];
}
- (BOOL)isHavePreviousMovie{
    return NO;
}
- (BOOL)isHaveNextMovie{
    return NO;
}
- (NSDictionary *)previousMovieURLAndTitleToTheCurrentMovie{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSURL URLWithString:@"http://v.youku.com/player/getRealM3U8/vid/XNjQ5MDM3Nzg0/type/mp4/v.m3u8"],KURLOfMovieDicTionary,@"qqqqqqq",KTitleOfMovieDictionary, nil];
    return dic;
}
- (NSDictionary *)nextMovieURLAndTitleToTheCurrentMovie{
    return nil;
}

@end
