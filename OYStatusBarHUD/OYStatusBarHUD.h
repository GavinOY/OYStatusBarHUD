//
//  OYStatusBarHUD.h
//  OYStatusBarHUDExample
//
//  Created by 欧阳志鑫 on 16/8/27.
//  Copyright © 2016年 欧阳志鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OYStatusBarHUD : UIView

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片  传图片而不是文件名的原因是更易扩展，因为可能不能通过文件名获取image，比如Graphics画出来的图片
 */
+(void)showMessage:(NSString*)msg image:(UIImage*)image;

+(void)showMessage:(NSString*)msg;

+(void)showSuccess:(NSString*)msg;

+(void)showError:(NSString*)msg;

+(void)showLoading:(NSString*)msg;

+(void)hide;
@end
