//
//  PhotoCollectionView.h
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property(nonatomic,retain) NSArray *imageArray;

@end
