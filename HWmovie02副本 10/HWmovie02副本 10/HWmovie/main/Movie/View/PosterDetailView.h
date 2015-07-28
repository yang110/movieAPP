//
//  PosterDetailView.h
//  HWmovie
//
//  Created by Mac on 15/7/25.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "StarView.h"
@interface PosterDetailView : UIView

@property (strong, nonatomic) IBOutlet StarView *starView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *laber1;
@property (strong, nonatomic) IBOutlet UILabel *laber2;
@property (strong, nonatomic) IBOutlet UILabel *laber3;

@property (strong, nonatomic) IBOutlet UILabel *laber4;
@property (nonatomic) MovieModel *modal;


@end
