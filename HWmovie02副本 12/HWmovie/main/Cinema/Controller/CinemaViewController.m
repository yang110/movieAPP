//
//  CinemaViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CinemaViewController.h"
#import "DataService.h"
#import "CinemaCell.h"

@interface CinemaViewController ()
{
        BOOL flag[20];
}
@end

@implementation CinemaViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"影院";
    }
    return self;
    
}

-(void)init110
{
    for (int i=0; i<20; i++) {
        flag[i]=YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self init110];
    [self loadData];
    [self createTableView];

    
}


-(void)loadData
{
    
    // 1  取出cinema_list.json modal数据
    _arrayOfDic=[[NSMutableArray alloc]init];
    NSMutableArray *array110=[[NSMutableArray alloc]init];
    NSDictionary *dic=[DataService loadData:@"cinema_list.json"];
    NSArray *array=dic[@"cinemaList"];
    for (NSDictionary *dic1 in array)
    {
     
        CinemaModal *modal=[[CinemaModal alloc]init  ];
        [modal setValuesForKeysWithDictionary:dic1];
        [array110 addObject:modal];
        
    }
    
    
    
    
   
    //2 取出 district_list.json数据  并且 添加个  @"moadl" : NSMutableArray类型对象
    
    
       NSDictionary *dic3=[DataService loadData:@"district_list.json"];
        NSArray *array111=dic3[@"districtList"];
 

    for ( NSDictionary *dic1100  in array111) {
        
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:dic1100];
        
        NSMutableArray *array=[[NSMutableArray alloc]init];
        
        
        [dic  setObject:array forKey:@"modal"];
        
        [_arrayOfDic addObject:dic];
        
        
    }
   // NSLog(@"%@",_arrayOfDic);
   
    
    
    // 3 modal分配到 @"moadl" : NSMutableArray类型对象 里面
    for (int i=0 ;i<array111.count;i++)
    {
        
        NSString *string1=[array111[i] objectForKey:@"id"];
        
        
        for (int j=0; j<array110.count; j++)
        {
           
            
            
            CinemaModal *modal=array110[j];
            NSString *string2=modal.districtId;
            
            
            if ([string1 isEqualToString:string2])
            {
                NSDictionary *dic = _arrayOfDic[i];
                NSMutableArray *array=dic[@"modal"];
                [array addObject:modal];
            }
            
            
        }
        
        
        
    }
    
    
  //  NSLog(@"%@",_arrayOfDic);
    
    
    
    // 4排序
    
    
    for(int i=0; i<_arrayOfDic.count;i++)
    {
        
        
        
        NSArray *array=_arrayOfDic[i][@"modal"];
        
        NSSortDescriptor *sd1=[NSSortDescriptor sortDescriptorWithKey:@"grade" ascending:NO];
         NSSortDescriptor *sd2=[NSSortDescriptor sortDescriptorWithKey:@"lowPrice" ascending:YES];
        NSArray *sdArray1=[NSArray arrayWithObjects:sd1,sd2 ,nil];
        NSArray *t=[array sortedArrayUsingDescriptors:sdArray1 ];
        
        [_arrayOfDic[i] setObject:t forKey:@"modal"];//key存在 则替换掉
        
    }
    
    
    
    
    
    
    
    
}

-(void)createTableView
{
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
    UINib *nib=[UINib nibWithNibName:@"CinemaCell" bundle:nil];
   [ _tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}


#pragma mark - 代理及按钮

//1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _arrayOfDic.count;
    
    
    
}

//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    
    NSDictionary *dic=_arrayOfDic[section];
    NSArray *array=dic[@"modal"];
    
    if (flag[section]==YES) {
        return 0;
    }
    
    
    return array.count;



}
//3
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
//    
//     MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    
//    
//    MovieModel *model =_modelArray[indexPath.row];
//    cell.movieModel=model;
    
    CinemaCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    NSDictionary *dic = _arrayOfDic[indexPath.section];
    
    
    cell.modal= dic[@"modal"][indexPath.row];
    
    return cell;
}

//返回Row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 90;
}
//返回Header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

//自定义头部
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIButton *button=[[UIButton alloc]init];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents: UIControlEventTouchUpInside];
    
    button.tag=section;
    
    [button setBackgroundImage:[UIImage imageNamed:@"tableCell_common.png"] forState:UIControlStateNormal ];
    
    NSDictionary *dic=_arrayOfDic[section];
    NSString *string=[dic objectForKey:@"name"];
    
    
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    
    
    
    return button;
    
}
//头部按钮执行代码
-(void)buttonAction:(UIButton *)button
{
    //NSLog(@"1");
    
    
    flag[button.tag]=!flag[button.tag];
    
    //行更新
    NSIndexSet *indexSet=[NSIndexSet indexSetWithIndex:button.tag];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
