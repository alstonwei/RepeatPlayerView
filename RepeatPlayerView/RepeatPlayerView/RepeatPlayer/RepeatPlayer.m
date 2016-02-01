//
//  RepeatPlayer.m
//  ReatPlayerDemo
//
//  Created by Shouqiang Wei on 15/12/16.
//  Copyright © 2015年 教练助理. All rights reserved.
//

#import "RepeatPlayer.h"

#import <AVFoundation/AVFoundation.h>

@interface RepeatPlayer()

{
    UIView* _containerView;
}
@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,strong) AVPlayerLayer *playerLayer;

@end

@implementation RepeatPlayer

- (void)dealloc
{
    [self.playerLayer removeFromSuperlayer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
- (BOOL)autoPlay{
    return  YES;
}

-(instancetype)initWithSrc:(NSURL*)src{
    if (self = [super init]) {
        [self setupWithUrl:src];
    }
    return self;
}

- (void)setUrl:(NSURL *)url
{
    [self setupWithUrl:url];
}

-(void)setupWithUrl:(NSURL*)src
{
    if (src) {
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:src];
        self.player = [AVPlayer playerWithPlayerItem:playerItem];
        self.player.volume = self.playerVolume;
        
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self addObserver];
    }
}

-(void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

+(instancetype)showInView:(UIView*) containerView src:(NSURL*) src{
    RepeatPlayer *repeatPlayer = [[RepeatPlayer alloc] initWithSrc:src];
    [repeatPlayer showInView:containerView];
    return repeatPlayer;
}

-(void)showInView:(UIView*) containerView
{
    _containerView = containerView;
    self.playerLayer.frame = containerView.layer.bounds;
    [containerView.layer insertSublayer:self.playerLayer atIndex:0];
    //self.playerLayer.position = CGPointMake(0, 0);
    self.playerLayer.backgroundColor = [UIColor clearColor].CGColor;
    if(self.autoPlay)
    {
        [self.player play];
    }
    [self.playerLayer setNeedsDisplay];
}

-(void)play
{
    [self.player play];
    //[self.playerLayer setNeedsDisplay];
}

-(void)pause
{
    [self.player pause];
    
}
//播放结束，自动循环播放。
- (void)moviePlayDidEnd:(NSNotification*)notification{
    
    AVPlayerItem *item = [notification object];
    [item seekToTime:kCMTimeZero];
    [self.player play];
}


-(void)setlayout
{
    if (_containerView) {
        self.playerLayer.frame = _containerView.layer.bounds;
    }
    
}

@end
