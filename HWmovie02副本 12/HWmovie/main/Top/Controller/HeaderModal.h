//
//  HeaderModal.h
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderModal : NSObject


@property (nonatomic) NSString  *titleCn;//电影名字
@property (nonatomic) NSArray *directors;//导演
@property (nonatomic) NSArray *actors;//主演
@property (nonatomic) NSArray *type;//类型
@property (nonatomic) NSDictionary *myRelease;//日期
@property (nonatomic) NSString  *image;//图
@property (nonatomic) NSArray *images;//4张图



@property (nonatomic) NSArray *videos;//


@end
