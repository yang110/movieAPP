//
//  BaseCollectionView.m
//  HWmovie
//
//  Created by Mac on 15/7/25.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "BaseCollectionView.h"
#import "UIViewExt.h"
@implementation BaseCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    
    self=[super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.delegate=self;
        self.dataSource=self;
        
      
        
        
    }
    return self;
    
}
//表格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //  NSLog(@"%f %f",kwidth*0.75, self.height);
    return CGSizeMake(self.itemWidth, self.height);
    
}
//滑动
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //NSLog(@"123");
    
    
    
    //targetContentOffset->x
    CGFloat x=targetContentOffset->x;
    
    
    NSInteger index=  (x+self.itemWidth/2)/self.itemWidth;
    
    //安全检查
    
    if (index<0) {
        index=0;
        
    }
    else if (index>self.modalArray.count)
    {
        index=self.modalArray.count-1;
        
        
    }
    
    targetContentOffset->x=self.itemWidth*index;
    
    
    
    self.currentIndex =index;
    
    
    
    
    
}
-(void)setModalArray:(NSArray *)modalArray
{
    _modalArray=modalArray;
   [self reloadData];  //不管有没有这行如何 都是01 02 03 都值进行一次
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return  _modalArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
    
    
    
    
}




@end
