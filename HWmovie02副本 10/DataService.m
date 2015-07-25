//
//  DataService.m
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+ (id)loadData1:(NSString *)string
{
    
    
    
    
    
    
    NSString *string1=[NSString stringWithFormat:@"https://api.douban.com/v2/movie/%@",string];
    
    //01 构建url
    NSURL *url = [NSURL URLWithString:string1];
    
    //02 构造请求
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:20];
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    
    //03 构造connection
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    //发送同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //04转化数据
    
    //NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // NSLog(@"%@",string);
    // 最终获得字典 或者 数组
    
   

    id arrayOrDic=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    
    return arrayOrDic;
}

+ (id)loadData:(NSString *)string
{
    
    NSString *path=[[NSBundle mainBundle] pathForResource:string ofType:nil];
    NSData *data=[NSData dataWithContentsOfFile:path];
    id arrayOrDic=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    
    return arrayOrDic;
}


@end
