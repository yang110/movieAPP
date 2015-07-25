//
//  NewsViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "StarView.h"

@interface NewsViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_array;
    UITableView *_tableView;

    
}
@end
