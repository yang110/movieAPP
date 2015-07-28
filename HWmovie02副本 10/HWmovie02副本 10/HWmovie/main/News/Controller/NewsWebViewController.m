//
//  NewsWebViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "NewsWebViewController.h"

@interface NewsWebViewController ()

@end

@implementation NewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    //（1）网上直接加载
    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
//    NSURL *url=[NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest *request=[NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];

    [self.view addSubview:webView];
    
    //（2）本地加载
    
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"news.html" ofType:nil];
    
//    NSString *htmlStr=[NSString stringWithContentsOfFile:filePath usedEncoding: NSUTF8StringEncoding error:nil];
    
    NSString *htmlStr=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [webView loadHTMLString:htmlStr baseURL:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
