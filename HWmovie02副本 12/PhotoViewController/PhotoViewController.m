//
//  PhotoViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionViewCell.h"
#import "common.h"
#import "UIViewExt.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController


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
    
    
    
    [self createNav];
    

    [self createCollectionView];
    
    
    
    
    
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNav) name:@"hiddenNav" object:nil];
}

-(void)createNav
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    
    
    //修改style的时候 会影响状态栏的颜色
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack ;
    
    //设置背景图片 会影响透明度（导航栏和标签栏都是，改了之后nav为不透明）
    [ self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:  UIBarMetricsDefault];
    
    //设置nav为透明
     self.navigationController.navigationBar.translucent=YES;
    

}

-(void)leftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)hiddenNav
{
    BOOL isHidden=self.navigationController.navigationBarHidden;
    isHidden=!isHidden;
    
    
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
    
    
    
}

-(void)createCollectionView
{
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    
    layout.itemSize=CGSizeMake(self.view.width, self.view.height-64);
    layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=10;
    

    
    _collectionView=[[ PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, kwidth+10, kheight) collectionViewLayout:layout];
    _collectionView.imageArray= _imageArray;
    [self.view addSubview:_collectionView];
    
    
    
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:self.index inSection:0];
    
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:    UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    

    

    
    
}





@end
