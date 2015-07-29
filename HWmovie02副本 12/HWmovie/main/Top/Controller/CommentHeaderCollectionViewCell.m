//
//  CommentHeaderCollectionViewCell.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CommentHeaderCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CommentHeaderCollectionViewCell

- (void)awakeFromNib {
   
 
    
}


-(void)setImage:(NSString *)image
{
    _image=image;
    
    
    
    [self setNeedsLayout];
    
    
}


-(void)layoutSubviews
{
    
       [_imageView1    sd_setImageWithURL:[NSURL URLWithString:_image]];
    
    
    _imageView1.layer.cornerRadius=10;
    _imageView1.layer.borderWidth=1;
    _imageView1.layer.borderColor=[UIColor whiteColor].CGColor;
    _imageView1.layer.masksToBounds=YES;
    
    
}

@end
