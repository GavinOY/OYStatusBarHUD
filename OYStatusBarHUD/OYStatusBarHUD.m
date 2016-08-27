//
//  OYStatusBarHUD.m
//  OYStatusBarHUDExample
//
//  Created by 欧阳志鑫 on 16/8/27.
//  Copyright © 2016年 欧阳志鑫. All rights reserved.
//

#import "OYStatusBarHUD.h"

#define OYStatusBarHUDMessageFont [UIFont systemFontOfSize:13]

/** 消息的停留时间 */
static CGFloat const  OYStatusBarHUDDuration = 2.0;

/** 消息显示\隐藏的动画时间 */
static CGFloat const  OYStatusBarHUDAnimationDuration = 0.25;

static UIWindow *OYStatusBarHUDWindow_;

static NSTimer * OYStatusBarHUDTimer_;

@implementation OYStatusBarHUD

+ (void)showWindow{
    CGFloat windowHeight = 20;
    CGRect windowFrame = CGRectMake(0, -windowHeight,CGRectGetWidth([UIScreen mainScreen].bounds), windowHeight);
    
    //多次创建后，会有残留，需清除
    OYStatusBarHUDWindow_.hidden = YES;
    
    UIWindow *window=[[UIWindow alloc]initWithFrame:windowFrame];
    window.backgroundColor = [UIColor blackColor];
    window.windowLevel = UIWindowLevelStatusBar;
    OYStatusBarHUDWindow_= window;
    OYStatusBarHUDWindow_.hidden =NO;
    
    windowFrame.origin.y = 0;
    [UIView animateWithDuration:OYStatusBarHUDAnimationDuration animations:^{
        OYStatusBarHUDWindow_.frame = windowFrame;
    }];
}

+(void)showMessage:(NSString*)msg image:(UIImage*)image{
    [OYStatusBarHUDTimer_ invalidate];
    
    [self showWindow];
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = OYStatusBarHUDMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = OYStatusBarHUDWindow_.bounds;
    [OYStatusBarHUDWindow_ addSubview:button];
    
    OYStatusBarHUDTimer_ = [NSTimer scheduledTimerWithTimeInterval:OYStatusBarHUDDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

+(void)showMessage:(NSString*)msg{
    [self showMessage:msg image:nil];
}

+(void)showSuccess:(NSString*)msg{
    [self showMessage:msg image:[UIImage
                                  imageNamed:@"OYStatusBarHUD.bundle/success"]];
}

+(void)showError:(NSString*)msg{
    [self showMessage:msg image:[UIImage
                                 imageNamed:@"OYStatusBarHUD.bundle/error"]];
}

+(void)showLoading:(NSString*)msg{
    [OYStatusBarHUDTimer_ invalidate];
    OYStatusBarHUDTimer_ = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc]init];
    label.font =OYStatusBarHUDMessageFont;
    label.frame = OYStatusBarHUDWindow_.bounds;
    label.textAlignment  = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [OYStatusBarHUDWindow_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    CGFloat msgWidth = [msg sizeWithAttributes:@{NSFontAttributeName:OYStatusBarHUDMessageFont}].width;
    CGFloat centerX = (CGRectGetWidth(OYStatusBarHUDWindow_.frame) -msgWidth)*0.5 -CGRectGetWidth(loadingView.frame);
    CGFloat centerY = CGRectGetHeight(OYStatusBarHUDWindow_.frame)*0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [OYStatusBarHUDWindow_ addSubview:loadingView];
    
    
}

+(void)hide{
    [UIView animateWithDuration:OYStatusBarHUDAnimationDuration animations:^{
        CGRect windowFrame = OYStatusBarHUDWindow_.frame;
        windowFrame.origin.y = -CGRectGetHeight(windowFrame);
        OYStatusBarHUDWindow_.frame = windowFrame;
    } completion:^(BOOL finished) {
        OYStatusBarHUDWindow_=nil;
        OYStatusBarHUDTimer_=nil;
    }];

}

@end
