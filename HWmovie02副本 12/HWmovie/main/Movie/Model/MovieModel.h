//
//  MovieModel.h
//  HWmovie
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject



@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) NSDictionary *images;
@property (nonatomic,assign) float average;
@property (nonatomic) NSString *original_title;


@end
