//
//  CommentViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderModal.h"

#import "CommentTableView.h"
@interface CommentViewController : UIViewController
{
    
    CommentTableView *_tableView;
    
    
}


@property (nonatomic) NSMutableArray *commentModalArray;
@property (nonatomic) HeaderModal *headerModal;

@end
