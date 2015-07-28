//
//  CommentTableViewCell.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    
    
  //  self.backgroundColor=[UIColor redColor];
    
    UILabel *laber2=[[UILabel alloc]initWithFrame:CGRectMake(82, 30, 166, 22) ];
    laber2.backgroundColor=[UIColor redColor];
    laber2.tag=100;
    
    [self.contentView addSubview:laber2];
    
    
    
    
    
}


-(void)setModal:(CommentModal *)modal
{
    
    _modal=modal;
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    

    NSString *string= _modal.userImage;
    
    [_imageView1    sd_setImageWithURL:[NSURL URLWithString:string]];
    
    _laber1.text=_modal.nickname;
    
    
    
    UILabel *laber2=(UILabel *)[self viewWithTag:100    ];
    laber2.text=_modal.content;
    

  
    
    _laber3.text=_modal.rating;
    
    
    

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
