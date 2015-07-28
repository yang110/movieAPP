//
//  TopCell.h
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModal.h"
#import "StarView.h"

@interface TopCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *topImageView;
@property (strong, nonatomic) IBOutlet UILabel *topTitle;
@property (strong, nonatomic) IBOutlet StarView *topStar;
@property (strong, nonatomic) IBOutlet UILabel *topAverage;

@property (strong, nonatomic)  TopModal *modal;


@end
