//
//  ImageListViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "ImageListViewController.h"
#import "DataService.h"
#import "ImageModal.h"
#import "common.h"
#import "ImageCell.h"

#import "PhotoViewController.h"

@interface ImageListViewController ()

@end

@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    
    self.view.backgroundColor=[UIColor redColor];
    
    
    
    [self loadData];
    [self createCollectionView];
    
    
    
    
}
- (void)loadData
{
    _array=[[NSMutableArray alloc]init];
    
    
    
    NSArray *array=[DataService loadData:@"image_list.json"];
    
    
    for ( NSDictionary *dic in array )
    {
    
        ImageModal *modal=[[ ImageModal alloc]init];
        [modal setValuesForKeysWithDictionary:dic];
        
        [_array addObject:modal];
        
    }
    
    
    
    
    
    
    
}

- (void)createCollectionView
{
    
    
   UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=CGSizeMake((kwidth-50)/4, (kwidth-50)/4);
    layout.sectionInset=UIEdgeInsetsMake(10, 10, 10,10);
    
    
    
    
    _collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    
    _collectionView.delegate   =self;
    _collectionView.dataSource=self;
    
   
    [self.view addSubview:_collectionView];
    
    
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    
    
    
}

//02
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _array.count;
}
//03
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    ImageCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    



    cell.modal=_array[indexPath.row];
    
    
    return cell;
    
    
    
    
}

//选中执行
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    //下面那句话 会调用一次init
    PhotoViewController *vc=[[PhotoViewController alloc]init];
    
    vc.index=indexPath.row;
    
    
    
    //直接调用didload,隐藏后 本函数用完后调用
   // vc.view.backgroundColor=[UIColor redColor];
    
    
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    
    
    
    
    
    NSMutableArray *array110=[[NSMutableArray alloc]init];
    for (int i=0; i<_array.count; i++)
    {
        ImageModal *modal=_array[i];
        
        NSString *string= modal.image;
        
        [array110    addObject:string];
        
        
        
    }
    
    
    vc.imageArray=array110;
    
    
    [self presentViewController:nav animated:YES completion:nil];
    
    

    
}



@end
