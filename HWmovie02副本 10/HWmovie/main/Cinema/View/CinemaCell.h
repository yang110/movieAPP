//
//  CinemaCell.h
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModal.h"

//@property NSString *address;
//@property NSString *grade;
//@property NSString *lowPrice;
//@property NSString *name;
//@property NSString *isCouponSupport;
//@property NSString *isSeatSupport;
//@property NSString *distance;

@interface CinemaCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *grade;
@property (strong, nonatomic) IBOutlet UILabel *lowPrice;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *isCouponSupport;
@property (strong, nonatomic) IBOutlet UIImageView *isSeatSupport;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@property(nonatomic) CinemaModal *modal;

@end
