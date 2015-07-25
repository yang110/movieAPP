//
//  ImageCell.m
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"

@implementation ImageCell

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self setNeedsLayout];
    }
    return self;
}


-(void)setModal:(ImageModal *)modal
{
    _modal=modal;
    [self setNeedsLayout];
}


-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    _image=[[UIImageView alloc]initWithFrame:self.bounds];
    
    
    
    [_image sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
    
    
    _image.layer.cornerRadius=10;
    _image.layer.borderWidth=1;
    _image.layer.borderColor=[UIColor whiteColor].CGColor;
    _image.layer.masksToBounds=YES;
    
    
    [self addSubview:_image];
    
    
   

    
    
    
}








@end
