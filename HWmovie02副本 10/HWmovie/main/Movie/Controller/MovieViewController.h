//
//  MovieViewController.h
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"


@interface MovieViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    
    UITableView *_movieTableView;//表视图
    PosterView *_posterView;  //海报视图
    
    NSMutableArray *_modelArray;//存放 modal的数组
    
    
}



@end
