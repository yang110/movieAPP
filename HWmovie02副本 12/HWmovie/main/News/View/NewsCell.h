//
//  NewsCell.h
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModal.h"

@interface NewsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *newsImageView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *summary;
@property (strong, nonatomic) IBOutlet UIImageView *type;


@property (nonatomic)NewsModal *newsModal;

@end
