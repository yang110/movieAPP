//
//  BaseCollectionView.h
//  HWmovie
//
//  Created by Mac on 15/7/25.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic ) NSArray *modalArray;

@property(nonatomic) NSInteger currentIndex;

@property(nonatomic) CGFloat itemWidth;


@end
