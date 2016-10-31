//
//  ViewController.m
//  04-自定义的瀑布流
//
//  Created by vera on 16/8/29.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import "WaterPullLayout.h"
#import "Goods.h"
#import "GoodsCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  数据源
 */
@property (nonatomic, strong) NSMutableArray *goodsArray;

@end

@implementation ViewController

- (NSMutableArray *)goodsArray
{
    if (!_goodsArray)
    {
        _goodsArray = [NSMutableArray array];
    }
    
    return _goodsArray;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        /**
         瀑布流
        */
        WaterPullLayout *layout = [[WaterPullLayout alloc] init];
        layout.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
       // layout.column = ;
    
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
//        layout.delegate = self;
        [self.view addSubview:collectionView];
        
        [collectionView registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
        
        _collectionView = collectionView;
    }
    
    return _collectionView;
}

/**
 *  封装数据模型
 */
- (void)handleGoodsObject
{
    //读取内容
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dic in arr)
    {
        Goods *goods = [Goods goodsWithDictionary:dic];
        
        [self.goodsArray addObject:goods];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  封装数据模型
     */
    [self handleGoodsObject];
    
    /**
     *  创建collectionView
     */
    [self collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.goodsArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.goods = self.goodsArray[indexPath.item];
    
    return cell;
}

/**
 *  返回cell的size
 *
 *  @param collectionView       <#collectionView description#>
 *  @param collectionViewLayout <#collectionViewLayout description#>
 *  @param indexPath            <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Goods *goods = self.goodsArray[indexPath.item];
    
    return CGSizeMake(goods.w, goods.h + 20);
}


@end
