//
//  WWFullScreenPlayerView.m
//  CoachProject
//
//  Created by Shouqiang Wei de Mac on 16/1/10.
//  Copyright © 2016年 教练助理. All rights reserved.
//

#import "RepeatPlayerView.h"
#import "RepeatPlayer.h"
@interface RepeatPlayerView()

@property(nonatomic,assign)BOOL showClose;
@property(nonatomic,strong)RepeatPlayer*repeatPlayer;

@property(nonatomic,strong)UIButton* closeButton;
@end

@implementation RepeatPlayerView


- (instancetype)initWithFrame:(CGRect)frame sourceUrl:(NSURL*)url
{
    if (self = [super initWithFrame:frame]) {
    
        _showClose = YES;
        [self setupCloseButton];
        [self setupTapGesture];
        [self.repeatPlayer setUrl:url];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.closeButton setFrame:CGRectMake(20, 20, 40, 40)];
    [self.repeatPlayer showInView:self];

}

-(UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton addTarget:self action:@selector(btnCloseClicked) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton setImage:[UIImage imageNamed:@"VKVideoPlayer_close"] forState:UIControlStateNormal];
        [_closeButton setFrame:CGRectMake(20, 20, 40, 40)];
    }
    return _closeButton;
}

-(void)setUrl:(NSURL *)url{
    [self.repeatPlayer setUrl:url];
}



-(void)btnCloseClicked
{
    [self.repeatPlayer pause];
    [self removeFromSuperview];
    self.repeatPlayer = nil;
}

-(void)tapGesture
{
    self.closeButton.hidden = !self.closeButton.hidden;
}

-(void)setupCloseButton
{
    [self addSubview:self.closeButton];
}

-(void)setupTapGesture
{
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [self addGestureRecognizer:tap];
}


- (RepeatPlayer *)repeatPlayer
{
    if (!_repeatPlayer) {
        _repeatPlayer = [[RepeatPlayer alloc] init];
        [_repeatPlayer setAutoPlay:YES];
    }
    return _repeatPlayer;
}


@end
