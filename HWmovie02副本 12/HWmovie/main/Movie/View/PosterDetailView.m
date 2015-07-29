//
//  PosterDetailView.m
//  HWmovie
//
//  Created by Mac on 15/7/25.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"
@implementation PosterDetailView



-(void)setModal:(MovieModel *)modal
{
    
    _modal=modal;
    
    
    [self setNeedsLayout];
    
    
    
    
    
}


-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    [_imageView   sd_setImageWithURL:[NSURL URLWithString:       _modal.images[@"small"]  ]];

    _laber1.text=_modal.title;
    _laber2.text=_modal.original_title;
    _laber3.text= [NSString stringWithFormat:@"年份 :%@", _modal.year];
   
    _laber4.text=[NSString stringWithFormat:@"%.1f 分",_modal.average];
    
    
    _starView.average=_modal.average;
    
    
    
}

@end
