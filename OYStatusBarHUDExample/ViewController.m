//
//  ViewController.m
//  OYStatusBarHUDExample
//
//  Created by 欧阳志鑫 on 16/8/27.
//  Copyright © 2016年 欧阳志鑫. All rights reserved.
//

#import "ViewController.h"
#import "OYStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)success:(id)sender {
    [OYStatusBarHUD showSuccess:@"成功了唉"];
}

- (IBAction)error:(id)sender {
    [OYStatusBarHUD showError:@"失败了哦"];
}

- (IBAction)loading:(id)sender {
    [OYStatusBarHUD showLoading:@"加载ing..."];
}

- (IBAction)hide:(id)sender {
    [OYStatusBarHUD hide];
}

- (IBAction)message:(id)sender {
    [OYStatusBarHUD showMessage:@"这是一条普通信息哦"];
}

@end
