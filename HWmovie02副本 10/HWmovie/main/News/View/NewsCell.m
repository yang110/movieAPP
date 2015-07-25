//
//  NewsCell.m
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
  //  NSLog(@"1212");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setNewsModal:(NewsModal *)newsModal
{
    
    _newsModal=newsModal;
    [self setNeedsLayout];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    

    _title.text=_newsModal.title;
    _summary.text=_newsModal.summary;
  
    
    
    NSString *string=_newsModal.image;
    [_newsImageView sd_setImageWithURL:[NSURL URLWithString:string]];
    
    
    _type.image=[UIImage imageNamed:@"sctpxw"];

    if (_newsModal.type==0)
    {
        _type.hidden=YES;
        
        
  
        
    }
    else
    {
        _type.hidden=NO;
        
        
    }
    
   // NSLog(@"%li",_newsModal.myId);


}



@end
