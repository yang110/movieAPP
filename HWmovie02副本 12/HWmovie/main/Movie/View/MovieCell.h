//
//  MovieCell.h
//  HWmovie
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "StarView.h"
@interface MovieCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;//图片imageView
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;//年份
@property (strong, nonatomic) IBOutlet StarView *myView;//star
@property (strong, nonatomic) IBOutlet UILabel *average;//评分

@property (retain,nonatomic) MovieModel *movieModel;//模型 里面有 所要显示的数据


@end
