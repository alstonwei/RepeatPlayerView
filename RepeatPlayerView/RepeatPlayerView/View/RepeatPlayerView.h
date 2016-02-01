//
//  WWFullScreenPlayerView.h
//  CoachProject
//
//  Created by Shouqiang Wei de Mac on 16/1/10.
//  Copyright © 2016年 教练助理. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepeatPlayerView : UIView


@property(nonatomic,strong)NSURL* url;
- (instancetype)initWithFrame:(CGRect)frame sourceUrl:(NSURL*)url;
@end
