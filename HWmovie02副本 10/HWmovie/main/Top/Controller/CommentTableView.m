//
//  CommentTableView.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "CommentTableView.h"
#import "common.h"
#import "CommentTableViewCell.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
@implementation CommentTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    
    self=[super initWithFrame:frame style:style];
    
    if (self) {
        
        
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor blackColor];
        
       
         self.separatorStyle= UITableViewCellSeparatorStyleNone;
        //组头
        [self createHeader];
        
        
        //注册
        
        
        UINib *nib=[UINib nibWithNibName:@"CommentTableViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"cell"];
        
        
        
    }
    return self;
    
}


-(void)createHeader
{
    
    
    
    //组头
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kwidth, 250)];
    view.backgroundColor=[UIColor clearColor];
    self.tableHeaderView=view;
    
    
    
    //组头里面有个collectionView
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=CGSizeMake(kwidth/4, 90);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    _headerCollectonView=[[CommentHeaderCollectionView alloc]initWithFrame:CGRectMake(5, 155, kwidth-10, 90)collectionViewLayout:layout];
    
   // _headerCollectonView.backgroundColor=[UIColor blueColor];
   // _headerCollectonView.delegate=
    
    [self.tableHeaderView addSubview:_headerCollectonView];
    
    
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 130)];
    imageView.tag=100;

    [self.tableHeaderView addSubview:imageView];
    
    
    
    UILabel *laber1=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 250, 25)];
    laber1.tag=101;
    laber1.textColor=[UIColor orangeColor];
    laber1.font=[UIFont systemFontOfSize:20 ];
    
    [self.tableHeaderView addSubview:laber1];
    

    UILabel *laber2=[[UILabel alloc]initWithFrame:CGRectMake(120, 35, 250, 25)];
    laber2.tag=102;
    laber2.textColor=[UIColor whiteColor];
    laber2.font=[UIFont systemFontOfSize:15 ];
    [self.tableHeaderView addSubview:laber2];
    
    UILabel *laber3=[[UILabel alloc]initWithFrame:CGRectMake(120, 65, 250, 25)];
    laber3.tag=103;
    laber3.textColor=[UIColor whiteColor];
    laber3.font=[UIFont systemFontOfSize:15 ];
    [self.tableHeaderView addSubview:laber3];

    
    UILabel *laber4=[[UILabel alloc]initWithFrame:CGRectMake(120, 95, 250, 25)];
    laber4.tag=104;
    laber4.textColor=[UIColor whiteColor];
    laber4.font=[UIFont systemFontOfSize:15 ];
    [self.tableHeaderView addSubview:laber4];

    
    UILabel *laber5=[[UILabel alloc]initWithFrame:CGRectMake(120, 125, 250, 25)];
    laber5.tag=105;
     laber5.textColor=[UIColor whiteColor];
    laber5.font=[UIFont systemFontOfSize:15 ];
    [self.tableHeaderView addSubview:laber5];
    
    

    

    
}
-(void)setHeaderModal:(HeaderModal *)headerModal
{
    _headerModal=headerModal;
    
    
    _headerCollectonView.headerModal=_headerModal;

    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    
    //self.tableHeaderView
    
    UIImageView *imageView=( UIImageView *)[self.tableHeaderView viewWithTag:100];
    NSString *string= _headerModal.image;
    [imageView sd_setImageWithURL:[NSURL URLWithString:string]];
    
    
    
    UILabel *laber=(UILabel *)[self.tableHeaderView viewWithTag:101];
    laber.text=_headerModal.titleCn;
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:102];
     laber.text=[NSString stringWithFormat:@"导演: %@",[_headerModal.directors firstObject]];
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:103];
    NSMutableString *string1=[[NSMutableString alloc]init];
    for (NSString *str in _headerModal.actors) {
        [string1 appendFormat:@"%@ ",str];
    }
    laber.text=[NSString stringWithFormat:@"主演: %@",string1];
    

    
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:104];
     NSMutableString *string2=[[NSMutableString alloc]init];
    for (NSString *str in _headerModal.type) {
        [string2 appendFormat:@"%@ ",str];
    }
    laber.text=[NSString stringWithFormat:@"类型: %@",string2];

    
    
    
    
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:105];
    NSMutableString *string3=[[NSMutableString alloc]init];

    NSDictionary *dic=_headerModal.myRelease;
    
      [string3 appendFormat:@"%@ ", dic[@"location"]];
  
    [string3 appendFormat:@"%@ ", dic[@"date"]];
    
    laber.text=string3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _commentModalArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.modal=_commentModalArray[indexPath.row];
    
    
    
    //复用要把变化的改过来
    UILabel *laber2=(UILabel *)[cell viewWithTag:100];
    UIImageView *imageView=(UIImageView *)[cell viewWithTag:200];
   
    if (isHit[indexPath.row])
    {
        imageView.height=cell.height-2;
    //    laber2.frame=CGRectMake(60, 30, 230, cell.height-28);
        laber2.height=cell.height-28;
       
    }
    else
    {
        imageView.height=48;
        laber2.height=22;
    }

    return cell;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (isHit[indexPath.row]) {
        
        CommentModal *modal=_commentModalArray[indexPath.row];
        CGFloat maxLabelWidth =kwidth-136;
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        //NSLog(@"%f",contenSize.height+30-0.281);
          return contenSize.height+30-0.281;
    }
    else
    {
        return 50;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isHit[indexPath.row]=!isHit[indexPath.row];
    [tableView reloadData];
    
}




@end
