//
//  TopCell.m
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "TopCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
#import "common.h"

@implementation TopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
   
}


- (void)setModal:(TopModal *)modal
{
    _modal=modal;
    [self setNeedsLayout];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];


    
    NSDictionary *dic=_modal.images;
    NSString *string= dic[@"small"];
    [_topImageView sd_setImageWithURL:[NSURL URLWithString:string]];
    

    _topTitle.text=_modal.title;
    
    
    
    NSDictionary *dic1=_modal.rating;
    CGFloat average=[dic1[@"average"] floatValue];
    _topAverage.text=[NSString stringWithFormat:@"%.1f",average];
   

    [_topStar setAverage:average];

    
    
    
    
    
}
@end
