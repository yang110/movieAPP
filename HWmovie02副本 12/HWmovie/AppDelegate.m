//
//  AppDelegate.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "StartViewController.h"
#import "BeginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    
    
    
    
      
        
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
//    MyTabBarController  *myTabBar=[[MyTabBarController alloc]init];
//    self.window.rootViewController=myTabBar;
//    
//    
//    
    
//    StartViewController *vc=[[StartViewController alloc]init];
//    self.window.rootViewController=vc;
//    
    
    
    
    
    
    
    
    
    
    //01 获取沙盒路径
    NSString *homePath=NSHomeDirectory();
    //02 NSString类关于 路径操作
    NSString *documentsPath=[homePath stringByAppendingPathComponent:@"Documents"];
    //单例方法(有则给他，没有则创建)
    NSFileManager *manager=[NSFileManager defaultManager];
    
    
    NSString *fliePath=[documentsPath   stringByAppendingPathComponent:@"file.text"];
    //检查文件是否存在
    BOOL  sucess=[manager fileExistsAtPath:fliePath];
    
    if (sucess) {
        NSLog(@"文件存在");
        
        
        
       
        StartViewController     *myTabBar=[[ StartViewController   alloc]init];
      self.window.rootViewController=myTabBar;
        
        
       
    }
    else
    {
        NSLog(@"文件不存在，创建");
        [manager createFileAtPath:fliePath contents:nil attributes:nil];
        BeginViewController     *vc=[[BeginViewController alloc]init];
        self.window.rootViewController=vc;
        

        
    }
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
