//
//  MyButton.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

//初始化
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    
    self=[super initWithFrame:frame];
    
    if (self!=nil) {
        
        _imageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        _imageView.image=[UIImage imageNamed:imageName];
        
        
        [self addSubview:_imageView];
        
        
        _label=[[UILabel alloc]initWithFrame:CGRectZero];
        _label.text=title;
        _label.textAlignment=NSTextAlignmentCenter;
        [_label setTextColor:[UIColor whiteColor]];
        _label.font=[UIFont systemFontOfSize:11];
        
        
        [self addSubview:_label];
        
    
        
        
    }
    
    
    return self;
}

//设尺寸和布局
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    CGFloat width=self.frame.size.width;
      
    
    _imageView.frame=CGRectMake((width-20)/2, 5, 20, 20);
    _label.frame=CGRectMake(0, CGRectGetMaxY(_imageView.frame), width, 20);
    
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
