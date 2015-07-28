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



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _array=[[NSMutableArray alloc]init];
 
    
    [self create];
    

    [self start];
    
}

-(void)create
{
    int k=1;
    CGFloat kkkkWidth=self.view.width/4;
    CGFloat kkkkHeight=self.view.height/6;
    
    
    CGPoint point[4];
    point[0]=CGPointMake(0, 1);
    point[1]=CGPointMake(1, 0);
    point[2]=CGPointMake(0, -1);
    point[3]=CGPointMake(-1, 0);
    
    
    
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

    int kkg=0;
    CGPoint kpoint=CGPointMake(0, 0);
    int kkk[6][8]={0};
    for (int i=0; i<6; i++) {
        kkk[i][7]=1;
        kkk[i][0]=1;
        
    }
    for (int i=0; i<8; i++) {
        kkk[6][i]=1;
        kkk[0][i]=1;
        
    }

    
    
    for (int i=0; i<24; i++)
    {
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed: [NSString stringWithFormat:@"%d",k++]]];
        [_array addObject:imageView];
        [self.view addSubview:imageView];
        imageView.alpha=0;
        
        imageView.frame=CGRectMake(kkkkWidth *kpoint.x, kkkkHeight* kpoint.y,kkkkWidth ,kkkkHeight );

        
        
        
        while () {
            <#statements#>
        }
        
        kpoint=CGPointMake(kpoint.x+point[kkg].x, kpoint.y+point[kkg].y);
        
        

        
        
        
        
        
        
        
        
    }
    
    
    

}


-(void)start
{
    UIImageView *imageView=_array[kkk];
    kkk++;
    
    if (kkk==24) {
        //  01 获取主窗口方法一
       // UIWindow *window=[UIApplication sharedApplication].keyWindow;
        
        //  02 获取主窗口方法二
        UIWindow *window=self.view.window;
        MyTabBarController  *myTabBar=[[MyTabBarController alloc]init];
        
        //多层效果
        myTabBar.view.transform=CGAffineTransformMakeScale(.2, .2);
        [UIView animateWithDuration:0.3 animations:^{
            myTabBar.view.transform=CGAffineTransformIdentity;
            
        }];
        
        window.rootViewController=myTabBar;
        return;
        
    }
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    imageView.alpha=1;
    [UIView commitAnimations];

    
    [self performSelector:@selector(start) withObject:self afterDelay:0.5];
    
    
}










@end
