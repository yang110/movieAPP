//
//  PhotoViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"

@interface PhotoViewController : UIViewController
{
    PhotoCollectionView *_collectionView;
    
  
    
}

@property(nonatomic,retain) NSArray *imageArray;

@property(nonatomic) NSInteger index;


@end
