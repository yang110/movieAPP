//
//  PhotoCollectionView.m
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PhotoCollectionView.h"

@implementation PhotoCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    
    
    if (self)
    {
        self.delegate=self;
        self.dataSource=self;
        self.pagingEnabled=YES;

        
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return self;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _imageArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    PhotoCollectionViewCell *cell=[self dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.imageUrl= _imageArray[indexPath.row];
    
    
    return cell;
    
    
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    PhotoCollectionViewCell *photoCell=(PhotoCollectionViewCell*)cell;
    
    
    
    [photoCell.scrollView setZoomScale:1.0   ];
    
    
    
}

@end
