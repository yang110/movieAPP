//
//  MoreCell.m
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MoreCell.h"
#import "UIImageView+WebCache.h"
@implementation MoreCell

- (void)awakeFromNib {
    // Initialization code
    
    UILabel *laber=[[UILabel alloc]initWithFrame:CGRectMake(300, 5, 100, 30)];
    laber.text=@"22";
    laber.textColor=[UIColor whiteColor];
    laber.tag=100;
    [self.contentView addSubview:laber];

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
    
    
    
    
    
    
    
   
    
    
    
    
    self.backgroundColor=[UIColor blackColor];
    
}

@end
