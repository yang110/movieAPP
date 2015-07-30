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
    int kkk;//重复调用时候
    
    CGFloat kkkkWidth;//小图 的 宽
    CGFloat kkkkHeight;//小图 的 高
    int k;//图片名字 初始化为1
    
    
    int temp;//总共 小图 数
    
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




- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor whiteColor];
    
    
    //可变这两个数字 来改变效果
    int maxWidth=5;
    int maxHeight=5;
    
    //算法 绕圈
    [self createCircleWithMaxWidth: maxWidth andmaxHeight:maxHeight ];
    
    //效果
    [self start];
    
}




-(void) createCircleWithMaxWidth:(int) maxWidth andmaxHeight:(int )maxHeight
{
    
    kkkkWidth=self.view.width/maxWidth;
    kkkkHeight=self.view.height/maxHeight;

    
    _array=[[NSMutableArray alloc]init];
    
    k=1;// [self create:i and:j];里面有用
    
    
    
    int minWidth=-1;//第一次循环最小左边
    int minHeight=0;//第一次循环最小上边
    
    
    int i=0;//当前要加的图的坐标
    int j=0;//当前要加的图的坐标
    
    int num=0;//当前加的 图的数目  ==temp时 退出循环
    
    temp=maxHeight*maxWidth;//总共 小图 数
    
    
    
    while (1)
    {
        
        //第一圈
        for ( ; j<maxWidth; j++,num++)
        {
            [self create:i and:j];
        }
        j--;
        i++;
        
        if (num==temp)
            break;
        
        for (  ; i<maxHeight;  i++,num++)
        {
            [self create:i and:j];
        }
        i--;
        j--;
        
        if (num==temp)
            break;
        
        for (   ; j>minWidth; j--,num++) {
            [self create:i and:j];
        }
        j++;
        i--;
        
        if (num==temp)
            break;
        
        for (; i>minHeight; i--,num++) {
            [self create:i and:j];
        }
        i++;
        j++;
        
        if (num==temp)
            break;
        
        
        //第二圈
        
        maxWidth--;
        maxHeight--;
        minWidth++;
        minHeight++;
        
        
        
        
        
    }
    
    
    
    
    
    //额外添加一张 为了最后一张图显示出来
    [self create:7 and:7 ];
    
    
}

-(void)create:(int )i and:(int )j
{
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed: [NSString stringWithFormat:@"%d",k++]]];
    
    
    imageView.frame=CGRectMake(kkkkWidth*j, kkkkHeight*i,kkkkWidth ,kkkkHeight );
    
    [_array addObject:imageView];
    [self.view addSubview:imageView];
    
    imageView.alpha=0;
    
}

-(void)start
{
    
    
    UIImageView *imageView=_array[kkk];
    
    
    kkk++;
    
    if (kkk==temp+1) {
        
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
