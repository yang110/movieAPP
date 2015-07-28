//
//  CommentViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CommentViewController.h"

#import "DataService.h"
#import "CommentModal.h"
#import "UIViewExt.h"
@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor=[UIColor redColor];
    
    

    
    [self loadDate];
    
    [self createTableView];
    
    
    
    
    
}
-(void)loadDate
{
    
    
    //HeaderModal读取  就一个
     NSDictionary *dic  =  [DataService loadData:@"movie_detail.json"];
    
    _headerModal=[[HeaderModal alloc]init];
    [_headerModal setValuesForKeysWithDictionary:dic];
    
    
    
    
    
    
    _commentModalArray =[[NSMutableArray alloc]init];
    
    
    NSDictionary *dic1  =  [DataService loadData:@"movie_comment.json"];
    NSArray *array=  dic1[@"list"];
    
    for( NSDictionary *dic110 in array)
    {
        
        CommentModal *modal=[[CommentModal alloc]init];
        [modal setValuesForKeysWithDictionary:dic110];
        [_commentModalArray addObject:modal];
        
        
    }
    
    
}

-(void)createTableView
{
    
    
    
    
    
    _tableView=[[CommentTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:     UITableViewStylePlain];
    
    //_tableView.backgroundColor=[UIColor blueColor];
    

    [self.view addSubview:_tableView];
    
    
    
    
    
    _tableView.headerModal=_headerModal;
    _tableView.commentModalArray=_commentModalArray;
    
    
    
    
}




@end
