//
//  PhotoCollectionViewCell.m
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation PhotoCollectionViewCell



//init 不进去  initWithFrame可以进去
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self)
    {
        
        
        _scrollView=[[PhotoScrollView alloc]initWithFrame:self.bounds];
       
        [self.contentView addSubview:_scrollView];
        
               
    }
    return self;
    
}



-(void)setImageUrl:(NSString *)imageUrl
{
    
    
    _imageUrl=imageUrl;

     _scrollView.imageUrl=_imageUrl;
    

    
}











@end
