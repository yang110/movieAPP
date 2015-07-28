//
//  ImageListViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    
    
    NSMutableArray *_array;
    UICollectionView *_collectionView;
    
}
@end
