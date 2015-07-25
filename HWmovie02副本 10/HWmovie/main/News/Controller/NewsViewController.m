//
//  NewsViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModal.h"
#import "common.h"

#import "NewsCell.h"
#import "DataService.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

#import "ImageListViewController.h"

@interface NewsViewController ()
{
    
    UIImageView *headImageView;
        UILabel *headLaber;
}
@end

@implementation NewsViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"新闻";
    }
    return self;
    
}


#pragma mark - 主要步骤
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadData];
    
    [self createNewsTableView];
    [self createHead];

    self.automaticallyAdjustsScrollViewInsets=YES;
}


#pragma mark - 步骤1 下载数据
-(void)loadData
{
    
    
    
    NSArray *array=  [DataService loadData:@"news_list.json" ];
    
    _array=[[NSMutableArray alloc]init];
    
    
    for (NSDictionary *dic in array)
    {
        NewsModal *modal=[[NewsModal alloc]init];
        [modal setValuesForKeysWithDictionary:dic];
        [_array addObject:modal];
    }
    
    
    
    
    
    
}

#pragma mark - 步骤2 创建TableView
-(void)createNewsTableView
{
    
    
    
   _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight)];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    
    [self.view addSubview:_tableView];
    
    
    //[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    //nib文件  不回访问 alloc  init
    UINib *nib=[UINib nibWithNibName:@"NewsCell" bundle:[NSBundle mainBundle]];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    
    
    
    
}

#pragma mark - 步骤2 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _array.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    //只要注册了 cell一定不为nil
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NewsModal *model =_array[indexPath.row];
    cell.newsModal=model;
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    return cell;
    
}

//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 90;
}

//滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // NSLog(@"滚动开始");
  //  NSLog(@"%f", scrollView.contentOffset.y);
    CGFloat y=  scrollView.contentOffset.y;
    if (y>-64)
    {
        //往上
        
        headImageView.top=-y;
        
        headLaber.bottom=headImageView.bottom;
        
        
        
    }
    else
    {
        
        CGFloat newHeight=fabs(y)-64+200;
        CGFloat newWidth=newHeight/200*kwidth;
        
        headImageView.frame=CGRectMake((kwidth-newWidth)/2, 64, newWidth, newHeight);
        
        headLaber.bottom=headImageView.bottom;
        

        
        
    }
   



}

//选中时候执行代码
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ImageListViewController *vc=[[ImageListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}


#pragma mark - 步骤3 创建头条视图
-(void)createHead
{
    
    //设置头视图
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, 200)];
    view.backgroundColor=[UIColor redColor];
    _tableView.tableHeaderView=view;
    
    //设置头视图
    headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, navKheight, kwidth, 200)];
    [self.view addSubview:headImageView];
    
    //设置头标签
    headLaber=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kwidth, 30)];
    headLaber.backgroundColor=[UIColor blackColor];
    headLaber.bottom=headImageView.bottom;
    headLaber.textAlignment= NSTextAlignmentCenter;
    headLaber.textColor=[UIColor whiteColor];
    headLaber.font=[UIFont systemFontOfSize:19];
    headLaber.alpha=0.7;
 
    
    [self.view addSubview:headLaber];
    
    //赋值 并除去数组第一个对象
    NewsModal *modal=_array[0];
    
    headLaber.text=modal.title;
    [headImageView sd_setImageWithURL:[NSURL URLWithString:modal.image]];
    
    
    [_array removeObjectAtIndex:0];

    
}

#pragma mark - 无关内容
-(UIStatusBarStyle)preferredStatusBarStyle
{
    
    
    //上一级有了 这边就不调用了 除非故意去［self...   pre］
    
    
    return UIStatusBarStyleLightContent ;
    
}

@end
