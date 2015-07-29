//
//  PosterView.h
//  HWmovie
//
//  Created by Mac on 15/7/24.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"

@interface PosterView : UIView
{
    
    UIView *_headerView;
    IndexCollectionView *_indexCollectionView;
   PosterCollectionView *_collectionView;
    
    
    UILabel *_bottomlabel;
    
    UIControl *_coverView;
    
}

@property (nonatomic) NSArray *modalArray;


@end
