//
//  MoreViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreCell.h"
#import "MoreModal.h"
#import "common.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"更多";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadData];
    [self createTableView];
    
    
    
    
    
}

-(void)loadData
{
    
    
    
    
    _array=[[NSMutableArray alloc]init];
    
    
    NSArray *array1=@[@"yang1",@"yang2",@"yang3",@"yang4",@"yang5",@"yang6"];
    NSArray *array2=@[@"清楚缓存",@"给个评价",@"检查心版本",@"商务合作",@"欢迎页",@"关于"];
    NSArray *array3=@[@"8.00M",@"",@"",@"",@"",@""];

    
    
    for (int i=0; i<6; i++) {
        MoreModal *modal=[[MoreModal alloc]init  ];
        modal.image=array1[i];
        modal.text1=array2[i];
        modal.text2=array3[i];
        
        [_array addObject:modal];
        
        
        
    }
    
}

-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight) style:UITableViewStyleGrouped] ;
    _tableView.dataSource=self;
    _tableView.delegate=self;

    [self.view addSubview:_tableView];
    
    
    UINib *nib=[UINib nibWithNibName:@"MoreCell" bundle:nil];
    [ _tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    

    _tableView.backgroundColor=[UIColor blackColor];

    
   
    
}



//1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
    
    
}

//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    
    return _array.count;
    
    
    
    
}


//3
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    MoreCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
   cell.modal =_array[indexPath.row];
    // cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
}

//选中时候执行代码
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    //07  UIAlertView
    UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"标题"
                                                 message:@"消息"
                                                delegate:self
                                       cancelButtonTitle:@"取消"
                                       otherButtonTitles:@"确定" ,nil];
    [alter show];

    
}



@end
