//
//  PosterCollectionView.m
//  HWmovie
//
//  Created by Mac on 15/7/24.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PosterCollectionView.h"

#import "PosterCollectionViewCell.h"
#import "common.h"
#import "UIViewExt.h"
#import "MovieModel.h"
@implementation PosterCollectionView

//初始化
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    
    self=[super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
//        self.delegate=self;
//        self.dataSource=self;
//        
       // self.pagingEnabled=YES;
        self.itemWidth=kwidth*0.75;
        
        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        
    }
    return self;
    
}


//03
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    //复原
 
    MovieModel  *modal=self.modalArray[indexPath.row];
    //NSDictionary *dic= modal.images;
    cell.modal=modal;
    
    
    
   // cell.urlImage=dic[@"large"];
    
    //cell.backgroundColor=[UIColor   greenColor];
    return cell;
    
    
    
}



//左右宽
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, kwidth*0.125, 0,  kwidth*0.125);
    
    
}


//选中滑动
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
   // NSLog(@"%li  %li",_curentIndex,indexPath.row);
    
    if (self.currentIndex==indexPath.row) {
        PosterCollectionViewCell *cell=( PosterCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
        
        [cell filpAction];
        

    }
    else
    {
    
        
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:
        UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex=indexPath.row;
        
        
    }
    
    
    
    
}
@end
