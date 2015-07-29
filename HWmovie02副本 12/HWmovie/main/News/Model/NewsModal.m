//
//  NewsModal.m
//  HWmovie
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "NewsModal.h"

@implementation NewsModal

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.myId=[value integerValue];
        
    }
    
}


-(NSString *)description
{
    
    return [NSString stringWithFormat:@"%@ %@ %@",_image,_title,_summary ];

}

@end
