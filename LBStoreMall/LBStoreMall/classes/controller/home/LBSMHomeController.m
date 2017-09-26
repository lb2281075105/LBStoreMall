//
//  LBSMHomeController.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/12.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHomeController.h"
#import "SubLBXScanViewController.h"
#import "LBSMNavController.h"
#import "LBSMMessageController.h"
#import "LBSMSearchTextField.h"
#import "LBSMHomeGrid.h"
#import "LBSMHomeGridCell.h"
#import "LBSMSlideshowHeadView.h"
#import "LBSMTopFooterView.h"
#import "LBSMHaoHuoHeadView.h"
#import "LBSMHaoHuoCell.h"
#import "LBSMNeedLifeCell.h"
#import "LBSMScrollAdFootView.h"
#import "LBSMPinPaiJingXuanCell.h"
#import "LBSMPinPaiHeaderView.h"
#import "LBSMHotCommendHeadView.h"
#import "LBSMHotCommendFootView.h"
#import "LBSMHotCommendCell.h"
#import "LBSMHotCommend.h"
#import "LBSMGoodsSetController.h"
@interface LBSMHomeController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/// 滑动视图
@property (strong , nonatomic)UICollectionView *collectionView;
/// 搜索
@property (strong , nonatomic)LBSMSearchTextField *searchTf;
/// 九宫格
@property (strong , nonatomic)NSMutableArray *homeGridArray;
/// 热门推荐
@property (strong , nonatomic)NSMutableArray<LBSMHotCommend *> *hotCommend;
/// 滚回顶部按钮
@property (strong , nonatomic)UIButton *backTopButton;

@end
/// cell
static NSString *const HomeGridCell = @"LBSMHomeGridCell";
static NSString *const HaoHuoCell = @"LBSMHaoHuoCell";
static NSString *const NeedLifeCell = @"LBSMNeedLifeCell";
static NSString *const PinPaiJingXuanCell = @"LBSMPinPaiJingXuanCell";
static NSString *const HotCommendCell = @"LBSMHotCommendCell";

/// head
static NSString *const SlideshowHeadView = @"LBSMSlideshowHeadView";
static NSString *const HaoHuoHeadView = @"LBSMHaoHuoHeadView";
static NSString *const PinPaiHeaderView = @"LBSMPinPaiHeaderView";
static NSString *const HotCommendHeadView = @"LBSMHotCommendHeadView";

/// foot
static NSString *const TopFooterView = @"LBSMTopFooterView";
static NSString *const ScrollAdFootView = @"LBSMScrollAdFootView";
static NSString *const HotCommendFootView = @"LBSMHotCommendFootView";


@implementation LBSMHomeController

- (UICollectionView *)collectionView{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        /// 不用设置集合视图的具体frame
        /// 需要时设置滑动方向
        _collectionView.frame = CGRectMake(0, 64, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight] - 64 - 49);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        /// cell
        [_collectionView registerClass:[LBSMHomeGridCell class] forCellWithReuseIdentifier:HomeGridCell];
        [_collectionView registerClass:[LBSMHaoHuoCell class] forCellWithReuseIdentifier:HaoHuoCell];
        [_collectionView registerClass:[LBSMNeedLifeCell class] forCellWithReuseIdentifier:NeedLifeCell];
        [_collectionView registerClass:[LBSMPinPaiJingXuanCell class] forCellWithReuseIdentifier:PinPaiJingXuanCell];
        [_collectionView registerClass:[LBSMHotCommendCell class] forCellWithReuseIdentifier:HotCommendCell];

        /// header
        [_collectionView registerClass:[LBSMSlideshowHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SlideshowHeadView];
        [_collectionView registerClass:[LBSMHaoHuoHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HaoHuoHeadView];
        [_collectionView registerClass:[LBSMPinPaiHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PinPaiHeaderView];
        [_collectionView registerClass:[LBSMHotCommendHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HotCommendHeadView];
        
        /// footer
        [_collectionView registerClass:[LBSMTopFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TopFooterView];
        [_collectionView registerClass:[LBSMScrollAdFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ScrollAdFootView];
        [_collectionView registerClass:[LBSMHotCommendFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HotCommendFootView];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (LBSMSearchTextField *)searchTf{

    if (_searchTf == nil) {
        /// 需要添加x y
        _searchTf = [[LBSMSearchTextField alloc]initWithFrame:CGRectMake(60, 25, [UIScreen cz_screenWidth] - 120, 35) withTitle:@" 618 100元红包等你来抢" withBool:true];
        _searchTf.backgroundColor = [UIColor cz_colorWithHex:0xcf3441];
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

/// 视图显示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == LBSMColor(231, 23, 37))return;
    self.navigationController.navigationBar.barTintColor = LBSMColor(231, 23, 37);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = LBSMColor(245, 245, 245);
    
    /// 设置导航
    [self setUpNav];
    
    /// 加载九宫格数组
    [self addJiuGrid];
    /// 热门推荐
    [self hotCommendMethod];
    /// 滑动到顶部
    [self setUpScrollToTopView];
}
- (void)setUpScrollToTopView{

    _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backTopButton];
    [_backTopButton addTarget:self action:@selector(scrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [_backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake([UIScreen cz_screenWidth] - 50, [UIScreen cz_screenHeight] - 110, 40, 40);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /// 判断回到顶部按钮是否隐藏
    _backTopButton.hidden = (scrollView.contentOffset.y > [UIScreen cz_screenHeight]) ? NO : YES;
}
/// 滑动到顶部
- (void)scrollToTop{

    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}
- (void)hotCommendMethod{

    _hotCommend = [LBSMHotCommend mj_objectArrayWithFilename:@"HomeHighGoods.plist"];

}
/// 懒加载
- (NSMutableArray *)homeGridArray{
    
    if (_homeGridArray == nil) {
        _homeGridArray = [[NSMutableArray alloc]init];
    }
    return _homeGridArray;
}
- (NSMutableArray *)hotCommend{
    
    if (_hotCommend == nil) {
        _hotCommend = [[NSMutableArray alloc]init];
    }
    return _hotCommend;
}

- (void)addJiuGrid{

    _homeGridArray = [LBSMHomeGrid mj_objectArrayWithFilename:@"GoodsGrid.plist"];
//    [self.collectionView reloadData];
}
/// 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        /// 九宫格
        return _homeGridArray.count;
    }
    if (section == 1) {
        /// 好货秒抢
        return 1;
    }
    if (section == 2) {
        /// 生活用品
        return 1;
    }
    if (section == 3) {
        /// 品牌推荐
        return PinPaiImagesArray.count;
    }
    if (section == 4) {
        /// 热门推荐
        return _hotCommend.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *collectionViewcell = nil;
    if (indexPath.section == 0) {
        /// 九宫格
        LBSMHomeGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeGridCell forIndexPath:indexPath];
        cell.homeGrid = _homeGridArray[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        collectionViewcell = cell;
    }else if (indexPath.section == 1) {
        /// 好货秒抢
        LBSMHaoHuoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HaoHuoCell forIndexPath:indexPath];
        collectionViewcell = cell;
    }else if (indexPath.section == 2) {
        /// 需要生活用品
        LBSMNeedLifeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NeedLifeCell forIndexPath:indexPath];
        cell.needLifeArray = NeedLifeArray;
        collectionViewcell = cell;
    }else if (indexPath.section == 3) {
        /// 品牌精选
        LBSMPinPaiJingXuanCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PinPaiJingXuanCell forIndexPath:indexPath];
        NSArray *images = PinPaiImagesArray;
        cell.imageStr = images[indexPath.row];
        collectionViewcell = cell;
    }else {
        /// 热门推荐
        LBSMHotCommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HotCommendCell forIndexPath:indexPath];
        cell.lookSameBlock = ^{
            NSLog(@"热门推荐第%zd商品的找相似",indexPath.row);
        };
        cell.hotCommend = _hotCommend[indexPath.row];
        collectionViewcell = cell;
    }
    return collectionViewcell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        /// 第0组九宫格组
        return CGSizeMake([UIScreen cz_screenWidth]/5 , [UIScreen cz_screenWidth]/5 + 10);
    }
    if (indexPath.section == 1) {
        /// 第1组好货秒抢
        return CGSizeMake([UIScreen cz_screenWidth], 150);
    }
    if (indexPath.section == 2) {
        /// 第2组商品
        return CGSizeMake([UIScreen cz_screenWidth],[UIScreen cz_screenWidth] * 0.35 + 120);
    }
    if (indexPath.section == 3) {
        /// 第3组品牌精选
        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
    }
    if (indexPath.section == 4) {
        /// 热门推荐
        return CGSizeMake(([UIScreen cz_screenWidth] - 4)/2, ([UIScreen cz_screenWidth] - 4)/2 + 40);
    }
    return CGSizeZero;
}
/// 对单元格宽度进行设置
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            layoutAttributes.size = CGSizeMake([UIScreen cz_screenWidth], [UIScreen cz_screenWidth] * 0.35);
        }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            layoutAttributes.size = CGSizeMake([UIScreen cz_screenWidth] * 0.5, [UIScreen cz_screenWidth] * 0.2);
        }else{
            layoutAttributes.size = CGSizeMake([UIScreen cz_screenWidth] * 0.25, [UIScreen cz_screenWidth] * 0.35);
        }
    }
    return layoutAttributes;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSLog(@"点击了第 %zd 个",indexPath.row);
    }else if (indexPath.section == 4){
        LBSMLog(@"热门推荐的第%zd个商品",indexPath.row);
        LBSMGoodsSetController *goodSetVc = [[LBSMGoodsSetController alloc] init];
        goodSetVc.goodName = @"ClasiftyGoods.plist";
        [self.navigationController pushViewController:goodSetVc animated:YES];
    }
}
/// X间距(这个X、Y的间距需要设置)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 4) ? 4 : 0;
}
/// Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 4) ? 4 : 0;
}
/// 组头视图、尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            LBSMSlideshowHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SlideshowHeadView forIndexPath:indexPath];
            reusableview = headerView;
        }else if (indexPath.section == 1){
            LBSMHaoHuoHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HaoHuoHeadView forIndexPath:indexPath];
            reusableview = headerView;
        }else if (indexPath.section == 3){
            LBSMPinPaiHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PinPaiHeaderView forIndexPath:indexPath];
            [headerView.pinPaiButton setTitle:@"品牌精选" forState:UIControlStateNormal];
            [headerView.pinPaiButton setTitleColor:LBSMColor(77, 171, 21) forState:UIControlStateNormal];
            [headerView.pinPaiButton setImage:[UIImage imageNamed:@"shouye_icon03"] forState:UIControlStateNormal];
            reusableview = headerView;
        }else if (indexPath.section == 4){
            /// 热门推荐
            LBSMHotCommendHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HotCommendHeadView forIndexPath:indexPath];
            [headerView.pinPaiButton setTitle:@"热门推荐" forState:UIControlStateNormal];
            [headerView.pinPaiButton setTitleColor:LBSMColor(14, 122, 241) forState:UIControlStateNormal];
            [headerView.pinPaiButton setImage:[UIImage imageNamed:@"shouye_icon02"] forState:UIControlStateNormal];
            reusableview = headerView;
        }
        
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {
            LBSMTopFooterView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TopFooterView forIndexPath:indexPath];
            reusableview = footview;
        }else if (indexPath.section == 2){
            LBSMScrollAdFootView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ScrollAdFootView forIndexPath:indexPath];
            reusableview = footerView;
        }else if (indexPath.section == 4) {
            LBSMHotCommendFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HotCommendFootView forIndexPath:indexPath];
            reusableview = footview;
        }
    }
    return reusableview;
}
/// head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        /// 图片滚动的宽高
        return CGSizeMake([UIScreen cz_screenWidth], 150);
    }
    if (section == 1 || section == 3 || section == 4) {
        /// 设置合适的宽高
        return CGSizeMake([UIScreen cz_screenWidth], 40);
    }
    return CGSizeZero;
}
/// foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        /// Top头条的宽高
        return CGSizeMake([UIScreen cz_screenWidth], 60);
    }
    if (section == 2) {
        /// 滚动广告
        return CGSizeMake([UIScreen cz_screenWidth], 80);
    }
    if (section == 4) {
        /// 热门推荐
        return CGSizeMake([UIScreen cz_screenWidth], 40);
    }
    return CGSizeZero;
}
/// 设置导航
- (void)setUpNav{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"richScan"] WithHighlighted:[UIImage imageNamed:@"richScan"] Target:self action:@selector(richScanItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"message"] WithHighlighted:[UIImage imageNamed:@"message"] Target:self action:@selector(messageItemClick)];

    [self searchTf];
}
/// 二维码扫码
- (void)richScanItemClick{
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    SubLBXScanViewController *vc = [[SubLBXScanViewController alloc]init];
    vc.title = @"扫一扫";
    vc.style = style;
    vc.isQQSimulator = YES;
    
    LBSMNavController *nav = [[LBSMNavController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
    vc.scanResult = ^(NSString *strScanned){
        LBSMLog(@"扫码结果");
    };
}
/// 消息按钮
- (void)messageItemClick
{
    LBSMMessageController *messageVc = [[LBSMMessageController alloc] init];
    messageVc.title = @"消息中心";
    [self.navigationController pushViewController:messageVc animated:YES];
}
/// 状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
