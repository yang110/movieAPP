//
//  TopViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "TopViewController.h"
#import "DataService.h"
#import "TopModal.h"
#import "common.h"
#import "TopCell.h"

@interface TopViewController ()

@end

@implementation TopViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Top250";
    }
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    [self loadData];
    [self createCollectionView];
    
}

-(void)loadData
{
    
    NSDictionary *dic=[DataService loadData1:@"top250"];
    
    NSArray *array=dic[@"subjects"];
    
    _array=[[NSMutableArray alloc]init];
    
    
    for (NSDictionary *dic1 in array )
    {
        TopModal *modal=[[TopModal alloc]init];
        
        
        
        [modal setValuesForKeysWithDictionary:dic1];
        
        
        [_array addObject:modal];
        
    }
    
    
    
    
}

-(void)createCollectionView
{
    

    //创建布局对象
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake((kwidth-40)/3, (kwidth-40)/3*1.5);
    
    //    layout.minimumInteritemSpacing=10;//左右距离（最小）
    //    layout.minimumLineSpacing=100;//上下距离（最小）
    //    layout.estimatedItemSize=CGSizeMake(100, 100);//估计大小
    
    layout.sectionInset=UIEdgeInsetsMake(10, 10, 10,10);
    
    
    //创建  collectionView
    collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.delegate=self;
    collectionView.dataSource=self;
    
    
    [self.view addSubview:collectionView];
    
    
//    [collectionView  registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
   
 
    
    //注册 [NSBundle mainBundle]可以为nil
    UINib *nib=[UINib nibWithNibName:@"TopCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
   
    

}


#pragma mark - 代理

//02
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _array.count;
}
//03
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   // cell.backgroundColor=[UIColor redColor];
    
    
    
    cell.modal=_array[indexPath.row];
    
    
    return cell;
    
    
    
    
}

@end
