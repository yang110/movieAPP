//
//  StarView.m
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "StarView.h"

@implementation StarView

#pragma mark －初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}


- (void)awakeFromNib {

    [super awakeFromNib];
    
    [self createSubviews];
    


}
//初始化所调用方法


-(void)createSubviews
{
    
    //设置_grayView和  _yellowView基本属性
    UIImage *image1=[UIImage imageNamed:@"gray"];
    UIImage *image2=[UIImage imageNamed:@"yellow"];

    
    _grayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0 ,image1.size.width*5, image1.size.height)];
    _yellowView=[[UIView alloc]initWithFrame:CGRectMake(0, 0 ,image2.size.width*5, image2.size.height)];
    
    _grayView.backgroundColor=[UIColor colorWithPatternImage:image1];
   _yellowView.backgroundColor=[UIColor colorWithPatternImage:image2];

    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    
    //放大倍数
    float scale=self.height/image1.size.height;
    
    
    //放大
    _grayView.transform=CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform=CGAffineTransformMakeScale(scale, scale);
    
    
    //改原点坐标
    _grayView.origin=CGPointZero;
    _yellowView.origin=CGPointZero;
    
    
}


#pragma mark －设置评分
- (void)setAverage:(float)average
{
    
    _average=average;
   [self setNeedsLayout];//设数之后调用layoutSubviews
}

//根据评分 改变黄星星视图的宽度
-(void)layoutSubviews
{
    [super layoutSubviews];
    _yellowView.width=_average/10*_grayView.width;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
