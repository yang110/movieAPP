//
//  IndexCollectionViewCell.m
//  HWmovie
//
//  Created by Mac on 15/7/25.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "IndexCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
@implementation IndexCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    
    
    self=[super initWithFrame:frame ];
    
    if (self) {
        
        [self createView];
        
        
        
        
    }
    return self;
    
}


-(void)createView
{
    
    //self.backgroundColor=[UIColor greenColor];
    
    
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.width*0.05, self.width*0.05, self.width*0.9, self.height*0.9)];
    [self.contentView addSubview:_imageView];
    
    
    
    
    
    
    
    
}


-(void)setModal:(MovieModel *)modal
{
    
    
    _modal=modal;

    [self setNeedsLayout];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    NSString *urlImage=_modal.images[@"small"];
    
    [_imageView   sd_setImageWithURL:[NSURL URLWithString:urlImage]];
    
    
    
    
    
    
}
@end
