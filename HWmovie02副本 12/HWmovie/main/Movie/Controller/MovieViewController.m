//
//  MovieViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MovieCell.h"

#import "common.h"
#import "DataService.h"

@interface MovieViewController ()



@end

@implementation MovieViewController


//调用init就会调用它
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"电影";
        
    }
    return self;
        
}

#pragma mark - 主要步骤
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadData];
    [self createNav];
   
    [self createMovieTableView];
    [self createPosterView];

    //对 viewController 延伸(不透明了 要加下面那句话 给延长   透明了就不用写下面那句话了)
    //self.edgesForExtendedLayout=UIRectEdgeAll;

    
    //对tableView (必须是viewController的第一个视图)进行移动
    self.automaticallyAdjustsScrollViewInsets=YES;
    
    
}


-(void)loadData
{
    
    
    
 
    //直接把文件里的数据 解析放到数组或字典里
    NSDictionary *dicData=[DataService loadData1:@"us_box"];
    
    
    NSArray *subjects=[dicData objectForKey:@"subjects"];
    _modelArray =[[NSMutableArray alloc]init];
    
    
    
    for (int i=0; i<subjects.count; i++) {
        
        NSDictionary *dic2=subjects[i][@"subject"];
        
        
        MovieModel *model=[[MovieModel alloc]init];
        
        model.title=dic2[@"title"];
        model.year = dic2[@"year"];
        model.images=dic2[@"images"];
        model.average =[dic2[@"rating"][@"average"] floatValue];
        model.original_title=dic2[@"original_title"];
        
        [_modelArray addObject:model];
        
        
    }
}

-(void)createNav
{
    
    
    UIView *flipView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    
    UIButton *btn1=[UIButton buttonWithType:  UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [btn1 sizeToFit];
    [flipView addSubview:btn1];
    btn1.tag=1;
    [btn1 addTarget:self action:@selector(filpAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2=[UIButton buttonWithType:  UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [flipView addSubview:btn2];
    btn2.hidden=YES;
    btn2.tag=2;
    [btn2 addTarget:self action:@selector(filpAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:flipView];
    self.navigationItem.rightBarButtonItem=item;
    
    
    
    
}

-(void)createMovieTableView
{
    
    
    
    
    _movieTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight)];
    _movieTableView.delegate=self;
    _movieTableView.dataSource=self;
    _movieTableView.backgroundColor=[UIColor blackColor];
    
    
    [self.view addSubview:_movieTableView];
    _movieTableView.hidden=YES;
    
    
    
    //nib文件  不回访问 alloc  init
    UINib *nib=[UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    
    
    //[_movieTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    
    
    
    
}

-(void)createPosterView
{
    
    _posterView=[[PosterView alloc]initWithFrame:self.view.bounds];
    _posterView.modalArray=_modelArray;
    
    [self.view addSubview:_posterView];
    
    
    
    
}

#pragma mark - nav buttonAction
//翻转
-(void)filpAction:(UIButton *)button
{
    // NSLog(@"%li",button.tag);
    UIView *flipView=self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *btn1=(UIButton *)[flipView viewWithTag:1];
    UIButton *btn2=(UIButton *)[flipView viewWithTag:2];
    
    
    if (button.tag==1)
    {
        [self flipView:flipView isLetf:YES];
        [self flipView:self.view isLetf:YES];
    }
    else if(button.tag==2)
    {
        [self flipView:flipView isLetf:NO];
        [self flipView:self.view isLetf:NO];
    }
    
    btn1.hidden=!btn1.hidden;
    btn2.hidden=!btn2.hidden;
    
    
    _movieTableView.hidden=! _movieTableView.hidden;
    _posterView.hidden=!_posterView.hidden;
    
    
}

//filpAction中调用
-(void)flipView:(UIView *)view isLetf:(BOOL)isLeft
{
    UIViewAnimationOptions option=isLeft? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight  ;
    
    [UIView transitionWithView:view duration:0.3 options: option  animations:nil completion:nil];
}


#pragma mark - MovieTableView  代理
//02
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _modelArray.count;
}
//03
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle 		reuseIdentifier:@"cell"];
//    }

    
    
    
    //只要注册了 cell一定不为nil
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    

    MovieModel *model =_modelArray[indexPath.row];
    cell.movieModel=model;
    
    
    
    return cell;
}
//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

@end
