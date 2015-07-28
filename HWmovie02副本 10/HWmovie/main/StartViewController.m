//
//  StartViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "StartViewController.h"
#import "UIViewExt.h"
#import "MyTabBarController.h"
@interface StartViewController ()
{
    int kkk;
    
    CGFloat kkkkWidth;
    CGFloat kkkkHeight;
    int k;
    
}
@end

@implementation StartViewController


-(instancetype)init
{
    self=[super init];
    
    if (self) {
        
    
    }
    return self;
}


-(void)create:(int )i and:(int )j
{
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed: [NSString stringWithFormat:@"%d",k++]]];
    
    
    imageView.frame=CGRectMake(kkkkWidth*j, kkkkHeight*i,kkkkWidth ,kkkkHeight );
    
    
    
    
    
    [_array addObject:imageView];
    [self.view addSubview:imageView];
    
    imageView.alpha=0;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _array=[[NSMutableArray alloc]init];
        k=1;
     kkkkWidth=self.view.width/4;
     kkkkHeight=self.view.height/6;
    
    
    

//    for (int i=0; i<6; i++)
//    {
//        for (int j=0; j<4; j++)
//        {
//            UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed: [NSString stringWithFormat:@"%d",k++]]];
//            
//            
//            imageView.frame=CGRectMake(kkkkWidth*j, kkkkHeight*i,kkkkWidth ,kkkkHeight );
//            
//            
//            
//            
//            
//            [_array addObject:imageView];
//            [self.view addSubview:imageView];
//            
//            imageView.alpha=0;
//            
//        }
//    }
//    
//
    int i=0;
    int j=0;
    for (j=0; j<4; j++)
    {
        [self create:i and:j];
    }
    j--;
    
    i++;
    for (  ; i<6;  i++)
    {
        [self create:i and:j];
    }
    i--;
    
    j--;
    for (; j>-1; j--) {
        [self create:i and:j];
    }
    j++;
    i--;
    for (; i>0; i--) {
        [self create:i and:j];
    }
    i++;
    j++;
    
    for (; j<3; j++) {
        [self create:i and:j];
    }

    j--;
    i++;
    
    for (; i<5  ; i++) {
        [self create:i and:j];
    }
    
    i--;
    j--;
    
    for (; j>0; j--) {
        [self create:i and:j];
        
    }
    
    j++;
    i--;
    for (; i>1; i--) {
        [self create:i and:j];
    }
    
    //额外添加一张 为了最后一张图显示出来
    [self create:7 and:7 ];
    
    
    

    [self start];
    
}

-(void)start
{
    
    
    UIImageView *imageView=_array[kkk];
    
    
    kkk++;
    
    if (kkk==25) {
        
        //  01 获取主窗口方法一
       // UIWindow *window=[UIApplication sharedApplication].keyWindow;
        
        //  02 获取主窗口方法二
        UIWindow *window=self.view.window;
        MyTabBarController  *myTabBar=[[MyTabBarController alloc]init];
        
        //多层效果
        myTabBar.view.transform=CGAffineTransformMakeScale(.2, .2);
        [UIView animateWithDuration:0.5 animations:^{
            myTabBar.view.transform=CGAffineTransformIdentity;
            
        }];
        
        window.rootViewController=myTabBar;
        return;
        
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    imageView.alpha=1;
    [UIView commitAnimations];

  

    
    [self performSelector:@selector(start) withObject:self afterDelay:0.2];
    
    
}










@end
