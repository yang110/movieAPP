//
//  PosterCollectionViewCell.m
//  HWmovie
//
//  Created by Mac on 15/7/24.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PosterCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "common.h"
@implementation PosterCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    
    
    self=[super initWithFrame:frame ];
    
    if (self) {

        [self createView];
        
        
        
        
    }
    return self;
    
}

-(void)setModal:(MovieModel *)modal
{
    
    
    _modal=modal;
    _detailView.modal=_modal;
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.detailView.hidden=YES;
    self.imageView.hidden=NO;
    self.isLeft=NO;
    
   
    
    NSString *urlImage=_modal.images[@"large"];
    
    [_imageView   sd_setImageWithURL:[NSURL URLWithString:urlImage]];

    
    
    
    
    
}

-(void)createView
{
    
    //self.backgroundColor=[UIColor greenColor];
    
    
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.width*0.05, self.width*0.05, self.width*0.9, self.height*0.9)];
    [self.contentView addSubview:_imageView];
    
    
    
    NSBundle *bundle=[NSBundle mainBundle];
    NSArray *views=[bundle loadNibNamed:@"PosterDetailView" owner:self options:nil];
    _detailView=[views lastObject];
    _detailView.hidden=YES;
    _detailView.frame=CGRectMake(self.width*0.05, self.width*0.05, self.width*0.9, self.height*0.9);
    
    [self.contentView addSubview:_detailView];
    
    
    
    
    
}

-(void)filpAction
{
    
    _isLeft=!_isLeft;
    
    
    if (_isLeft) {
        [self flipView:self isLetf:YES];
        
    }
    else
    {
        
        
        [self flipView:self isLetf:NO];
        
    }
    
    
    _detailView.hidden=!_detailView.hidden;
    _imageView.hidden=!_imageView.hidden;

    
}

//filpAction中调用
-(void)flipView:(UIView *)view isLetf:(BOOL)isLeft
{
    UIViewAnimationOptions option=isLeft? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight  ;
    
    [UIView transitionWithView:view duration:0.3 options: option  animations:nil completion:nil];
}






@end
