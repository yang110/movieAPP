//
//  CommentHeaderCollectionView.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CommentHeaderCollectionView.h"
#import "CommentHeaderCollectionViewCell.h"

@implementation CommentHeaderCollectionView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    
    
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        
    
        //因为要用播放器  需要 controller  所以代理给了 CommentViewController
        
        self.layer.cornerRadius=10;
        self.layer.borderWidth=1;
        self.layer.borderColor=[UIColor whiteColor].CGColor;
        self.layer.masksToBounds=YES;
        
        
        UINib *nib1=[UINib nibWithNibName:@"CommentHeaderCollectionViewCell" bundle:[NSBundle mainBundle]];
       
        [self registerNib:nib1 forCellWithReuseIdentifier:@"cell"];
        
        
    
        
    }
    return self;
    
    
    
    
}


-(void)setHeaderModal:(HeaderModal *)headerModal
{
    
    _headerModal=headerModal;
    
   
    
   
    
    
}


@end
