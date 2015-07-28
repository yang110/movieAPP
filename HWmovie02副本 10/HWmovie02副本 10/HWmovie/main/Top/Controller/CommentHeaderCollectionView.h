//
//  CommentHeaderCollectionView.h
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderModal.h"
@interface CommentHeaderCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property (nonatomic) HeaderModal *headerModal;

@end
