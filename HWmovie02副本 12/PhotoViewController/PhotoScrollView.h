//
//  PhotoScrollView.h
//  HWmovie
//
//  Created by Mac on 15/7/23.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
    
}

@property (nonatomic,strong)  NSString *imageUrl;

@end
