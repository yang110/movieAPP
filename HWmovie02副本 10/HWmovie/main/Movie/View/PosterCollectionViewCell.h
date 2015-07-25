//
//  PosterCollectionViewCell.h
//  HWmovie
//
//  Created by Mac on 15/7/24.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "MovieModel.h"
@interface PosterCollectionViewCell : UICollectionViewCell
{
    
 
    
}
@property BOOL isLeft;


@property UIImageView *imageView;

@property PosterDetailView *detailView;


@property (nonatomic) MovieModel *modal;

-(void)filpAction;

@end
