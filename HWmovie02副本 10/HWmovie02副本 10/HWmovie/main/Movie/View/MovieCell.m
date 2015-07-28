//
//  MovieCell.m
//  HWmovie
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"


@implementation MovieCell



//xib创建 不回访问init  会访问下面那个
- (void)awakeFromNib {
    //设置成 不能选取状态
    self.selectionStyle=   UITableViewCellSelectionStyleNone;
    
}



-(void)setMovieModel:(MovieModel *)movieModel
{
    _movieModel=movieModel;
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    //创建 123
    _titleLabel.text=_movieModel.title;
    _yearLabel.text = [NSString stringWithFormat:@"年份:%@",_movieModel.year];
    _average.text=[NSString stringWithFormat:@"%.1f",_movieModel.average];
    
    //开源框架，设置图片 4
    NSString *string=[_movieModel.images objectForKey:@"small"];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:string]];
    
    //创建star 5
    _myView.average=_movieModel.average;
    

}


@end
