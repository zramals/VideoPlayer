//
//  PlayerView.h
//  VideoPlayer3
//
//  Created by 焦英博 on 16/9/17.
//  Copyright © 2016年 焦英博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class PlayerView;
@protocol PlayerViewDelegate <NSObject>
@optional
- (void)didClickFullScreenButtonWithPlayerView:(PlayerView *)playerView;
@end

@interface PlayerView : UIView
@property (nonatomic, weak) id<PlayerViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *totalTime;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *fullButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@property (nonatomic, copy) NSString *urlString; //视频地址
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

/** 初始化方法 */
+ (instancetype)viewWithFrame:(CGRect)frame;
/** 播放 */
- (void)pv_play;
/** 暂停 */
- (void)pv_pause;

@end

@interface ToolView : UIView

@end
