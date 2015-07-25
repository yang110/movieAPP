//
//  MoreCell.m
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MoreCell.h"

@implementation MoreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModal:(MoreModal *)modal
{
    
    _modal=modal;
    [self setNeedsLayout];
    
}


-(void)layoutSubviews
{
    
    
    
    
    _moreImageView.image=[UIImage imageNamed:_modal.image];
    
    _laber1.text=_modal.text1;
    
    _laber2.text=_modal.text2;
    
    self.backgroundColor=[UIColor blackColor];
    
}

@end
