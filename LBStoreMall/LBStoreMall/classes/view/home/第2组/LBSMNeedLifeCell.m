//
//  LBSMNeedLifeCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/23.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMNeedLifeCell.h"
#import "LBSMNeedLifeGoodCell.h"
@interface LBSMNeedLifeCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *collectionView;
/// 头部ImageView
@property (strong , nonatomic)UIImageView *headImageView;
/// 图片数组
@property (strong , nonatomic)NSArray *imagesArray;

@end
static NSString *const NeedLifeGoodCell = @"LBSMNeedLifeGoodCell";

@implementation LBSMNeedLifeCell
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = CGRectMake(0, [UIScreen cz_screenWidth] * 0.35 + 10, [UIScreen cz_screenWidth], 100);
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LBSMNeedLifeGoodCell class] forCellWithReuseIdentifier:NeedLifeGoodCell];
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
    
    _headImageView = [[UIImageView alloc] init];
    [self addSubview:_headImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo([UIScreen cz_screenWidth] * 0.35);
    }];
}

/// 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imagesArray.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBSMNeedLifeGoodCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NeedLifeGoodCell forIndexPath:indexPath];
    cell.imageStr = _imagesArray[indexPath.row + 1];
    return cell;
}


#pragma mark - Setter Getter Methods
- (void)setNeedLifeArray:(NSArray *)needLifeArray
{
    _needLifeArray = needLifeArray;
    _imagesArray = needLifeArray;
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:needLifeArray[0]]];
}

@end
