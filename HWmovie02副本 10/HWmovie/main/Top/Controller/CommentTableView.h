//
//  CommentTableView.h
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommentHeaderCollectionView.h"

#import "HeaderModal.h"

@interface CommentTableView : UITableView<UITableViewDelegate,UITableViewDataSource >
{
    
    
    
  //  UIView *_view;//暂时顶替上面那个
    BOOL isHit[30];
    
    
}

@property (nonatomic)  CommentHeaderCollectionView *headerCollectonView;


@property (nonatomic) NSMutableArray *commentModalArray;
@property (nonatomic) HeaderModal *headerModal;




@end
