//
//  LBSMHaoHuoCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHaoHuoCell.h"
#import "LBSMHaoHuoGoodsCell.h"
#import "LBSMHaoHuoGoodsModel.h"
@interface LBSMHaoHuoCell ()

/// collectionView
@property (strong , nonatomic)UICollectionView *collectionView;
/// 推荐商品数据
@property (strong , nonatomic)NSMutableArray *huoGoodsArray;
/// 底部
@property (strong , nonatomic)UIView *bottomLineView;

@end
static NSString *const HaoHuoGoodsCell = @"LBSMHaoHuoGoodsCell";

@implementation LBSMHaoHuoCell
- (NSMutableArray *)huoGoodsArray
{
    if (!_huoGoodsArray) {
        _huoGoodsArray = [NSMutableArray array];
    }
    return _huoGoodsArray;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(self.dc_height * 0.65, self.dc_height * 0.9);
        /// 滚动方向(设置集合视图和滑动视图的方向)
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        /// 大小为父视图的一样，超出部分就会朝着设置的方向滑动，不用设置集合视图的具体frame
        _collectionView.frame = self.bounds;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[LBSMHaoHuoGoodsCell class] forCellWithReuseIdentifier:HaoHuoGoodsCell];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
    NSArray *countDownArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"CountDownShop.plist" ofType:nil]];
    _huoGoodsArray = [LBSMHaoHuoGoodsModel mj_objectArrayWithKeyValuesArray:countDownArray];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = LBSMColor(245, 245, 245);
    [self addSubview:_bottomLineView];
    _bottomLineView.frame = CGRectMake(0, self.dc_height - 8, [UIScreen cz_screenWidth], 8);
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
}

/// 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _huoGoodsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBSMHaoHuoGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HaoHuoGoodsCell forIndexPath:indexPath];
    cell.model = _huoGoodsArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了计时商品 %zd 个",indexPath.row);
}

@end
