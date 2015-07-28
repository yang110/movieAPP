//
//  MoreCell.h
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreModal.h"

@interface MoreCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *moreImageView;


@property (strong, nonatomic) IBOutlet UILabel *laber1;




@property(nonatomic) MoreModal *modal;


@end
