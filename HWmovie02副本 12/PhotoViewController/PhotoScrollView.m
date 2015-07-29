//
//  PhotoScrollView.m
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        _imageView =[[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.contentMode= UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        
        self.delegate=self;
        self.maximumZoomScale   =3;
        self.minimumZoomScale=0.5;
        
        
        
        
        UITapGestureRecognizer  *doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap)];
        
        
        //敲击次数
        doubleTap.numberOfTapsRequired=2;
        //触摸点个数
        doubleTap.numberOfTouchesRequired=1;
        [self addGestureRecognizer:doubleTap];
        
        
        
        
        UITapGestureRecognizer  *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap)];
        
        //触摸点个数
        doubleTap.numberOfTouchesRequired=1;
        [self addGestureRecognizer:singleTap];

        //双击 屏蔽单机
        [singleTap requireGestureRecognizerToFail:doubleTap];
        
        
        
        
    }
    return self;
}

-(void)singleTap
{
    

    
    
    [[NSNotificationCenter defaultCenter ]postNotificationName:@"hiddenNav" object:self userInfo:nil];
    
    
    
}

-(void)doubleTap
{
    if (self.zoomScale==1) {
        [self setZoomScale:3 animated:YES];
        
    }
    else
    {
        [self setZoomScale:1 animated:YES];
        
    }
    
}


-(void)setImageUrl:(NSString *)imageUrl
{
    
    _imageUrl=imageUrl;
    [self setNeedsLayout];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSURL *url=[NSURL URLWithString:_imageUrl];
    [_imageView sd_setImageWithURL:url];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
    
}

@end
