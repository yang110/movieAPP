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
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=0;
    layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 10);
    
    
    _headerCollectonView=[[CommentHeaderCollectionView alloc]initWithFrame:CGRectMake(5, 155, kwidth-10, 90)collectionViewLayout:layout];
    
   // _headerCollectonView.backgroundColor=[UIColor blueColor];
    
    
    [self.tableHeaderView addSubview:_headerCollectonView];
    
    
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 110)];
    imageView.tag=100;

    [self.tableHeaderView addSubview:imageView];
    
    
    
    UILabel *laber1=[[UILabel alloc]initWithFrame:CGRectMake(110, 5, 200, 25)];
    laber1.tag=101;
    laber1.textColor=[UIColor orangeColor];
    [self.tableHeaderView addSubview:laber1];
    

    UILabel *laber2=[[UILabel alloc]initWithFrame:CGRectMake(110, 35, 200, 25)];
    laber2.tag=102;
      laber2.textColor=[UIColor whiteColor];
    [self.tableHeaderView addSubview:laber2];
    
    UILabel *laber3=[[UILabel alloc]initWithFrame:CGRectMake(110, 65, 200, 25)];
    laber3.tag=103;
    laber3.textColor=[UIColor whiteColor];
    [self.tableHeaderView addSubview:laber3];

    
    UILabel *laber4=[[UILabel alloc]initWithFrame:CGRectMake(110, 95, 200, 25)];
    laber4.tag=104;
    laber4.textColor=[UIColor whiteColor];
    [self.tableHeaderView addSubview:laber4];

    
    UILabel *laber5=[[UILabel alloc]initWithFrame:CGRectMake(110, 125, 200, 25)];
    laber5.tag=105;
     laber5.textColor=[UIColor whiteColor];
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
    laber.text=[_headerModal.directors firstObject];
    
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:103];
    NSMutableString *string1=[[NSMutableString alloc]init];
    for (NSString *str in _headerModal.actors) {
        [string1 appendFormat:@"%@ ",str];
    }
    laber.text=string1;
    
    
    laber=(UILabel *)[self.tableHeaderView viewWithTag:104];
     NSMutableString *string2=[[NSMutableString alloc]init];
    for (NSString *str in _headerModal.type) {
        [string2 appendFormat:@"%@ ",str];
    }
    laber.text=string2;
    
    
    
    
    
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
    
    
    
    return cell;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
    
    if (isHit[indexPath.row]) {
        
        CommentModal *modal=_commentModalArray[indexPath.row];
        
        
        CGFloat maxLabelWidth =kwidth-200;
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        
          return contenSize.height+30;
    }
    else
    {
        return 50;
        
    }
  





}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    CommentTableViewCell *cell=( CommentTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    UILabel *laber=(UILabel *)   [cell.contentView viewWithTag:100    ];
  
    
    CGFloat maxLabelWidth =kwidth-200;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
   // NSLog(@"%@",laber.text);
    
      CGSize contenSize = [laber.text boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    //NSLog(@"%f", contenSize.height);
    
    
    if (isHit[indexPath.row])
    {
        
        laber.numberOfLines=1;
     laber.frame=CGRectMake(82, 30, 166, 22);
    }
    else
    {
        laber.numberOfLines=0;
     
        laber.frame=CGRectMake(82, 30, 166, contenSize.height) ;
        

    }
    
      isHit[indexPath.row]=!isHit[indexPath.row];
    
    [tableView reloadData];
    
    
    
//    CGFloat maxLabelWidth =kwidth-140;
//    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
//    CGSize contenSize = [_message.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    
    
   // [self tableView:self   heightForRowAtIndexPath:indexPath];
    

    
    
    
    
    
}




@end
