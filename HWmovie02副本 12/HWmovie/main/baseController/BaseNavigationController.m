//
//  BaseNavigationController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

//设置5个nav的视图图片，及透明度
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //修改style的时候 会影响状态栏的颜色
    self.navigationBar.barStyle=UIBarStyleBlack ;
    
    //设置背景图片 会影响透明度（导航栏和标签栏都是，改了之后nav为不透明）
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:  UIBarMetricsDefault];

    //设置nav为透明
    self.navigationBar.translucent=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    
    //调用最上层的子类控制器
    //return [self.topViewController   preferredStatusBarStyle];
    
    return UIStatusBarStyleLightContent ;
    
}

@end
