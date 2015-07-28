//
//  CinemaCell.m
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor=[UIColor blackColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModal:(CinemaModal *)modal
{
    
    _modal =modal;
    [self setNeedsLayout];
    
    
}

-(void)layoutSubviews
{
    
    
    
    _address.text=_modal.address;
    _grade.text=_modal.grade;
    
    
    CGFloat price=[_modal.lowPrice floatValue];
    
    
    _lowPrice.text=[NSString stringWithFormat:@"¥%.1f",price];
    
    
    
    
    _name.text=_modal.name;
    
    
    
    if ([_modal.isSeatSupport boolValue]==NO) {
        _isSeatSupport.hidden=YES;
        
    }
    else
    {
          _isSeatSupport.hidden=NO;
    }
    
    
    
    if ([_modal.isCouponSupport isEqualToString:@"1"]) {
        _isCouponSupport.hidden=YES;
        
    }
    else
    {
        _isCouponSupport.hidden=NO;
    }
    
    
    
    _distance.text=@"10km";
    
    if(_modal.distance ==nil)
    {
        _distance.text=[NSString stringWithFormat:@"10km"];
        
    }
    else
    {
        _distance.text=_modal.distance;
        
    }
    
    
    
    
    
    
    
}

@end
