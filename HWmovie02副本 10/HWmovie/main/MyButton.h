//
//  MyButton.h
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIControl
{
    
    UIImageView *_imageView;
    UILabel *_label;
    
    
}

-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;


@end
