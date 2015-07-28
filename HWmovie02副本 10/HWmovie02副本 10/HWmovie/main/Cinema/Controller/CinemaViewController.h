//
//  CinemaViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

//版本2


#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaModal.h"

//1212

@interface CinemaViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    
    NSMutableArray *_arrayOfDic;
    UITableView *_tableView;
    
}


@property CinemaModal *modal;




@end
