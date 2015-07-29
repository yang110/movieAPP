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
    
    
    self.selectionStyle= UITableViewCellSelectionStyleNone;
    
    
  //  self.backgroundColor=[UIColor redColor];
    
    UILabel *laber2=[[UILabel alloc]initWithFrame:CGRectMake(73, 30, 230, 22) ];
   // laber2.backgroundColor=[UIColor redColor];
    laber2.tag=100;
   // laber2.backgroundColor=[UIColor orangeColor];
     laber2.numberOfLines=0;
    laber2.textColor=[UIColor blackColor];
    
    [self.contentView addSubview:laber2];
    
    _imageView1.layer.cornerRadius=10;
    _imageView1.layer.borderWidth=1;
     _imageView1.layer.borderColor=[UIColor whiteColor].CGColor;
    _imageView1.layer.masksToBounds=YES;

    
    
    _imageView2.layer.cornerRadius=10;
    _imageView2.layer.borderWidth=1;
    _imageView2.layer.borderColor=[UIColor whiteColor].CGColor;
    _imageView2.layer.masksToBounds=YES;
    
    
    
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
