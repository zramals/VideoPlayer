//
//  ViewController.m
//  VideoPlayerDemo
//
//  Created by 焦英博 on 16/9/22.
//  Copyright © 2016年 焦英博. All rights reserved.
//

#import "ViewController.h"
#import "FullScreenController.h"
#import "PlayerView.h"

@interface ViewController ()<PlayerViewDelegate>

@property (nonatomic, strong) PlayerView *playerView;
@property (nonatomic, strong) FullScreenController *fullVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _playerView = [PlayerView viewWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 200)];
    _playerView.delegate = self;
    _playerView.urlString = @"http://svideo.spriteapp.com/video/2016/0915/8224a236-7ac8-11e6-ba32-90b11c479401cut_wpd.mp4";
    [self.view addSubview:_playerView];
    
    _fullVC = [[FullScreenController alloc] init];
}

#pragma mark - PlayerViewDelegate
- (void)didClickFullScreenButtonWithPlayerView:(PlayerView *)playerView
{
    if (_playerView.fullScreen == NO) {
        _fullVC.fullScreenVC = self;
        [self presentViewController:_fullVC animated:NO completion:^{
            _playerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [_fullVC.view addSubview:_playerView];
        }];
    } else {
        [self dismissViewControllerAnimated:NO completion:^{
            CGFloat width = MIN(self.view.bounds.size.height, self.view.bounds.size.width);
            _playerView.frame = CGRectMake(0, 50, width, 200);
            [self.view addSubview:_playerView];
        }];
    }
}

// 不自动旋转
- (BOOL)shouldAutorotate {
    return NO;
}
// 竖屏显示
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
@end