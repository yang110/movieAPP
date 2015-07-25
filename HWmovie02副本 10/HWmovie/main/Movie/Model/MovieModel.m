//
//  MovieModel.m
//  HWmovie
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel


//用于验证是否读取到数据
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %f",self.title,self.year,self.images,self.average];
}

@end
