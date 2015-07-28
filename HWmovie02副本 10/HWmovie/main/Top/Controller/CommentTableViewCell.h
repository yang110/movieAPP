//
//  CommentTableViewCell.h
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModal.h"
@interface CommentTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView1;

@property (strong, nonatomic) IBOutlet UIImageView *imageView2;

@property (strong, nonatomic) IBOutlet UILabel *laber1;



@property (strong, nonatomic) IBOutlet UILabel *laber3;



@property (nonatomic) CommentModal *modal;



@end
