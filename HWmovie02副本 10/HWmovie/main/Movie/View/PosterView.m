//
//  PosterView.m
//  HWmovie
//
//  Created by Mac on 15/7/24.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "PosterView.h"
#import "common.h"
#import "UIViewExt.h"
#import "MovieModel.h"
#define kHeaderViewH 136
#define kIndexCollectionViewH 100

#define kBottomTitleLableH 35
#define kBottomTitleLableY (kheight-tabBarKheight-kBottomTitleLableH)

#define kHeaderOffH   36
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH)
#define kPosterColletionViewH  (kheight-kPosterColletionViewY-tabBarKheight-kBottomTitleLableH)



@implementation PosterView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        [self createCollectionView];
        
        
        [self createCoverView];
        
        
        [self createHeader];
        [self createbottonLaber];
        
        [self createGesture];
        
        
        
        [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:   NSKeyValueObservingOptionNew  context:nil];
        
        [_collectionView addObserver:self forKeyPath:@"currentIndex" options:   NSKeyValueObservingOptionNew  context:nil];
        
        
    }
    return self;
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    
    
    
    
    NSNumber *number=change[@"new"];
    NSInteger index=[number integerValue];
    
    
  
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0    ];
    
    
    if ([object isKindOfClass:[IndexCollectionView class] ]&&_collectionView.currentIndex!=index)
    {
          
        //小海报动了
              [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _collectionView.currentIndex=index;
        
    
    }
    else if([object isKindOfClass:[PosterCollectionView class] ]&&_indexCollectionView.currentIndex!=index)
    {
        //大海报动了
       

        [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _indexCollectionView.currentIndex=index;
        
        
        
        
        
    }
    
    
    MovieModel  *modal=_modalArray[index];
    _bottomlabel.text=modal.title;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

-(void)createCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection=  UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=0;
    
    layout.minimumInteritemSpacing=0;
    
    _collectionView=[[PosterCollectionView alloc]initWithFrame:CGRectMake(0, kPosterColletionViewY, kwidth,kPosterColletionViewH) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor clearColor];
    
    
    [self addSubview:_collectionView];
    
    
    
    
}


-(void)setModalArray:(NSArray *)modalArray
{
    _modalArray=modalArray;
    _collectionView.modalArray=_modalArray;
    _indexCollectionView.modalArray=_modalArray;
    
    
    //先创建 后赋值  所以只能放这
    MovieModel *modal=_modalArray[0];
    _bottomlabel.text=modal.title;
    
}

-(void)createCoverView
{
    _coverView=[[UIControl alloc]initWithFrame:self.bounds];
    _coverView.backgroundColor=[UIColor colorWithWhite:0.8 alpha:0.8];
    _coverView.hidden=YES;
    [_coverView addTarget:self action:@selector(coverViewAction) forControlEvents:    UIControlEventTouchUpInside];
    
    
    [self addSubview:_coverView];
    
}

-(void)createHeader
{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, -kHeaderOffH, kwidth, kHeaderViewH)];
  //  _headerView.backgroundColor=[UIColor  redColor];
    [self addSubview:_headerView];
    
    //背景视图
    UIImage *image=[UIImage imageNamed:@"indexBg_home"];
    image =[image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:_headerView.bounds];
    imageView.image=image;
    [_headerView addSubview:imageView];
    
    
    //滑动视图
    
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kIndexCollectionViewH)];
//    view.backgroundColor=[UIColor greenColor];
//    [_headerView addSubview:view];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection=  UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=0;
    
    layout.minimumInteritemSpacing=0;
    
    _indexCollectionView=[[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kwidth,kIndexCollectionViewH) collectionViewLayout:layout];
   // _indexCollectionView.backgroundColor=[UIColor blueColor];
    
    [_headerView addSubview:_indexCollectionView];

    //按钮
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((kwidth-20)/2,kHeaderViewH -25 , 20, 20)];
   // button.backgroundColor=[UIColor redColor];
    
    [button setImage:[UIImage imageNamed:@"down_home"] forState:   UIControlStateNormal   ];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:       UIControlStateSelected  ];
    
    
    [button addTarget:self action:@selector(butonAction:) forControlEvents:UIControlEventTouchDown ];
    button.tag=100;
    
    [_headerView addSubview:button];
    
    
    
}

-(void)createbottonLaber
{
    
    _bottomlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, kBottomTitleLableY, kwidth, kBottomTitleLableH)];
    _bottomlabel.backgroundColor=[UIColor clearColor];
  
    _bottomlabel.textAlignment=    NSTextAlignmentCenter ;
    _bottomlabel.textColor=[UIColor whiteColor];
    
    
    [self addSubview:_bottomlabel ];
    
    
}

-(void)createGesture
{
    
    
    UISwipeGestureRecognizer *swipeDown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownAction)];
    swipeDown.direction=  UISwipeGestureRecognizerDirectionDown ;
    [self addGestureRecognizer:swipeDown];
    
}



#pragma mark - action

-(void)coverViewAction
{
    
    
   // NSLog(@"2");
    
    UIButton *button=(UIButton *)[_headerView viewWithTag:100];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    button.selected=!button.selected;
    
    _headerView.top=-36;
    _coverView.hidden=YES;
    
    [UIView commitAnimations];
    
}

-(void)butonAction:(UIButton *)button
{
    // NSLog(@"1");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    button.selected=!button.selected;

    if (button.selected)
    {
        
        //显示
        _headerView.top=64;
        _coverView.hidden=NO;
        
    }
    else
    {
        //隐藏
        _headerView.top=-36;
        _coverView.hidden=YES;
        
    }
   
    
    [UIView commitAnimations];
    
    
}

-(void)swipeDownAction
{
    
    //NSLog(@"2");
    
    UIButton *button=(UIButton *)[_headerView viewWithTag:100];
    
  
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
   button.selected=!button.selected;
    
    _headerView.top=64;
    _coverView.hidden=NO;
      [UIView commitAnimations];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
