//
//  MyTabBarController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MyTabBarController.h"

#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"


#import "MyButton.h"

#import "BaseNavigationController.h"


@interface MyTabBarController ()

@end

@implementation MyTabBarController





#pragma mark - 总体步骤
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setFramework];
    [self setTabBar];
    self.tabBar.translucent=YES;
}

#pragma mark - 步骤1 设置总体结构
-(void)setFramework
{
    MovieViewController *vc1=[[MovieViewController alloc]init];
    NewsViewController *vc2=[[NewsViewController alloc]init];
    TopViewController   *vc3=[[TopViewController alloc]init];
    CinemaViewController *vc4=[[CinemaViewController alloc]init];
    MoreViewController *vc5=[[MoreViewController alloc]init];
    NSArray *array=@[vc1,vc2,vc3,vc4,vc5];

    NSMutableArray *marray=[[NSMutableArray array]init];
    for (int i=0; i<5; i++)
    {
        BaseNavigationController *nav=[[BaseNavigationController alloc]initWithRootViewController:array[i] ];
        [marray addObject:nav];
    }
    self.viewControllers=marray;
}

#pragma mark - 步骤2 设置TabBar样式
-(void)setTabBar
{
    //删除原有
    for (UIView *view in self.tabBar.subviews)
    {
        //  NSLog(@"%@",view);
        
        Class class=NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class])
        {
            [view removeFromSuperview];
        }
        
        
        
        
    }
    
    //设置背景
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    
    //增加子视图
    CGFloat width=CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height=CGRectGetHeight(self.tabBar.frame);
    
    
    NSArray *array=@[@"movie_cinema.png",@"msg_new.png",@"start_top250.png",@"icon_cinema.png",@"more_select_setting.png"];
    NSArray *title=@[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    
    
    
    //selectedImageView
    
    _selectedImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    _selectedImageView.image=[UIImage imageNamed:@"selectTabbar_bg_all"];
    
    
    [self.tabBar addSubview:_selectedImageView];
    
    
    //button
    for (int i=0; i<5; i++)
    {
        MyButton *button=[[MyButton alloc]initWithFrame:CGRectMake(i*width, 0, width, height) withImageName:array[i] withTitle:title[i]];
        
        [button addTarget: self action:@selector(buttionAction:) forControlEvents:UIControlEventTouchUpInside ];
        button.tag=i;
        
        [self.tabBar addSubview:button];
        
        
        
        
        
        
        
    }
    
    /*
     for (int i=0; i<5; i++) {
     
     
     
     //方法一  添加按钮
     UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
     
     [button setTitle:title[i] forState:  UIControlStateNormal];
     [button setTitleColor:[UIColor whiteColor] forState:  UIControlStateNormal];
     
     [button setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
     
     
     button.titleLabel.font=[UIFont systemFontOfSize:11];
     
     button.titleEdgeInsets=UIEdgeInsetsMake(30, -20, 0, 0);
     button.imageEdgeInsets=UIEdgeInsetsMake(-10, 20, 0, 0);
     [self.tabBar addSubview:button];
     
     
     
     
     
     }
     */
    
    
    
    
    
    
    
    
}

//TabBar中按钮 执行效果 和 切换动画
- (void)buttionAction:(UIButton *)button
{
    self.selectedIndex=button.tag;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    _selectedImageView.center=button.center;
    [UIView commitAnimations];
}





@end
