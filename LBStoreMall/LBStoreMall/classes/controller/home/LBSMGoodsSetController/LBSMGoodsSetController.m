//
//  LBSMGoodsSetController.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMGoodsSetController.h"
#import "LBSMSearchTextField.h"
#import "LBSMGoodListCommend.h"
#import "LBSMGoodListCollectionCell.h"
#import "LBSMGoodGridCollectionCell.h"
@interface LBSMGoodsSetController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/// 切换视图按钮
@property (strong , nonatomic)UIButton *switchButton;
/// 查找商品
@property (strong , nonatomic)LBSMSearchTextField *searchTf;
/// 0：列表视图，1：格子视图
@property (nonatomic, assign) BOOL isSwitchGrid;
/// 推荐model
@property (strong , nonatomic)NSMutableArray<LBSMGoodListCommend *> *goodListCommend;
@property (strong , nonatomic)UICollectionView *collectionView;

@end
static NSString *const GoodListCollectionCell = @"LBSMGoodListCollectionCell";
static NSString *const GoodGridCollectionCell = @"LBSMGoodGridCollectionCell";
//static NSString *const DCListGridCellID = @"DCListGridCell";

@implementation LBSMGoodsSetController

/// 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, 64, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight] - 64);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        /// header
        
        /// cell
    
//        [_collectionView registerClass:[DCCustionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCCustionHeadViewID]; //头部View
        /// 栈格样式的
        [_collectionView registerClass:[LBSMGoodGridCollectionCell class] forCellWithReuseIdentifier:GoodGridCollectionCell];
        /// 列表样式的
        [_collectionView registerClass:[LBSMGoodListCollectionCell class] forCellWithReuseIdentifier:GoodListCollectionCell];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置导航
    [self setUpNav];
    /// 设置基本信息
    [self setUpInfo];
    /// 设置数据
    [self setUpData];
    
}
- (instancetype)initWithGoodName:(NSString *)goodName
{
    self = [super init];
    if (self) {
        _goodName = goodName;
    }
    return self;
}
/// 设置数据
- (void)setUpData{

    _goodListCommend = [LBSMGoodListCommend mj_objectArrayWithFilename:_goodName];
    NSLog(@"_goodListCommend:%@",_goodListCommend);
}
- (void)setUpInfo{
    // 默认列表视图
    _isSwitchGrid = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = LBSMColor(245, 245, 245);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // self.collectionView.backgroundColor = self.view.backgroundColor;
}
/// 设置导航
- (void)setUpNav{
    _switchButton = [[UIButton alloc] initWithFrame:CGRectMake(kWindowW - 50, 10, 44, 44)];
    _switchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_switchButton setImage:[UIImage imageNamed:@"nav_btn_jiugongge"] forState:UIControlStateNormal];
    [_switchButton setImage:[UIImage imageNamed:@"nav_btn_list"] forState:UIControlStateSelected];
    [_switchButton addTarget:self action:@selector(switchButtonBarItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_switchButton];
    
    [self searchTf];
}
- (void)switchButtonBarItemBtnClick:(UIButton *)button{

    LBSMLog(@"点击切换");
}
- (LBSMSearchTextField *)searchTf{
    
    if (_searchTf == nil) {
        /// 需要添加x y
        _searchTf = [[LBSMSearchTextField alloc]initWithFrame:CGRectMake(60, 25, [UIScreen cz_screenWidth] - 120, 35) withTitle:@" 快速查找商品" withBool:false];
        _searchTf.backgroundColor = [UIColor cz_colorWithHex:0x999999];
        self.navigationItem.titleView = _searchTf;
        /// 右边的按钮
        _searchTf.rightBtnClickBlock = ^{
            LBSMLog(@"右边点击");
        };
        /// 编辑按钮
        _searchTf.searchBlock = ^{
            LBSMLog(@"点击textF");
        };
    }
    return _searchTf;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == LBSMColor(245, 245, 245))return;
    self.navigationController.navigationBar.barTintColor = LBSMColor(245, 245, 245);
}
/// 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goodListCommend.count;
}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    DCListGridCell *cell = nil;
//    cell = (_isSwitchGrid) ? [collectionView dequeueReusableCellWithReuseIdentifier:DCListGridCellID forIndexPath:indexPath] : [collectionView dequeueReusableCellWithReuseIdentifier:DCSwitchGridCellID forIndexPath:indexPath];
//    cell.youSelectItem = _setItem[indexPath.row];
//    
//    __weak typeof(self)weakSelf = self;
//    if (_isSwitchGrid) { //列表Cell
//        __weak typeof(cell)weakCell = cell;
//        cell.colonClickBlock = ^{ // 冒号点击
//            __strong typeof(weakSelf)strongSelf = weakSelf;
//            [strongSelf setUpColonInsView:weakCell];
//            [strongSelf.colonView setUpUI]; // 初始化
//            strongSelf.colonView.collectionBlock = ^{
//                NSLog(@"点击了收藏%zd",indexPath.row);
//            };
//            strongSelf.colonView.addShopCarBlock = ^{
//                NSLog(@"点击了加入购物车%zd",indexPath.row);
//            };
//            strongSelf.colonView.sameBrandBlock = ^{
//                NSLog(@"点击了同品牌%zd",indexPath.row);
//            };
//            strongSelf.colonView.samePriceBlock = ^{
//                NSLog(@"点击了同价格%zd",indexPath.row);
//            };
//        };
//    }
//    
//    return cell;
//}
//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    UICollectionReusableView *reusableview = nil;
//    if (kind == UICollectionElementKindSectionHeader){
//        
//        DCCustionHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCCustionHeadViewID forIndexPath:indexPath];
//        __weak typeof(self)weakSelf = self;
//        headerView.filtrateClickBlock = ^{//点击了筛选
//            [weakSelf filtrateButtonClick];
//        };
//        reusableview = headerView;
//    }
//    return reusableview;
//}

@end
