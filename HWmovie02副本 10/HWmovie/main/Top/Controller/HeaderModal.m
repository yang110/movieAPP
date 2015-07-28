//
//  HeaderModal.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "HeaderModal.h"

@implementation HeaderModal

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    //一个要写 release 改成 myRelease
    
    if ([key isEqualToString:@"release"]) {
        self.myRelease=value;
        
    }
    
    
}



@end



