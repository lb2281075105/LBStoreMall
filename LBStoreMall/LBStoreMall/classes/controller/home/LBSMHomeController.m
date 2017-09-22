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
@interface LBSMHomeController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/// 滑动视图
@property (strong , nonatomic)UICollectionView *collectionView;
/// 搜索
@property (strong , nonatomic)LBSMSearchTextField *searchTf;
/// 九宫格
@property (strong , nonatomic)NSMutableArray *homeGridArray;

@end
/// cell
static NSString *const HomeGridCell = @"LBSMHomeGridCell";
static NSString *const HaoHuoCell = @"LBSMHaoHuoCell";
/// head
static NSString *const SlideshowHeadView = @"LBSMSlideshowHeadView";
static NSString *const HaoHuoHeadView = @"LBSMHaoHuoHeadView";
/// foot
static NSString *const TopFooterView = @"LBSMTopFooterView";

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
        /// cell九宫格
        [_collectionView registerClass:[LBSMHomeGridCell class] forCellWithReuseIdentifier:HomeGridCell];
        [_collectionView registerClass:[LBSMHaoHuoCell class] forCellWithReuseIdentifier:HaoHuoCell];
        /// header
        [_collectionView registerClass:[LBSMSlideshowHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SlideshowHeadView];
        [_collectionView registerClass:[LBSMHaoHuoHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HaoHuoHeadView];
        
        
        /// footer
        [_collectionView registerClass:[LBSMTopFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TopFooterView];

        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (LBSMSearchTextField *)searchTf{

    if (_searchTf == nil) {
        /// 需要添加x y
        _searchTf = [[LBSMSearchTextField alloc]initWithFrame:CGRectMake(60, 25, [UIScreen cz_screenWidth] - 120, 35)];
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
    
}
- (NSMutableArray *)homeGridArray{
    
    if (_homeGridArray == nil) {
        _homeGridArray = [[NSMutableArray alloc]init];
    }
    return _homeGridArray;
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
//    if (section == 2) { //掌上专享
//        return 1;
//    }
//    if (section == 3) { //推荐
//        return GoodsHandheldImagesArray.count;
//    }
//    if (section == 4) { //猜你喜欢
//        return _youLikeItem.count;
//    }
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
    }
    
 
    return collectionViewcell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        /// 九宫格组
        return CGSizeMake([UIScreen cz_screenWidth]/5 , [UIScreen cz_screenWidth]/5 + 10);
    }
    if (indexPath.section == 1) {
        /// 好货秒抢
        return CGSizeMake([UIScreen cz_screenWidth], 150);
    }
//    if (indexPath.section == 2) {//掌上
//        return CGSizeMake(ScreenW,ScreenW * 0.35 + 120);
//    }
//    if (indexPath.section == 3) {//推荐组
//        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
//    }
//    if (indexPath.section == 4) {//猜你喜欢
//        return CGSizeMake((ScreenW - 4)/2, (ScreenW - 4)/2 + 40);
//    }
    return CGSizeZero;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//10
        NSLog(@"点击了第 %zd 个",indexPath.row);
    }else if (indexPath.section == 4){
//        NSLog(@"点击了推荐的第%zd个商品",indexPath.row);
//        DCGoodsSetViewController *goodSetVc = [[DCGoodsSetViewController alloc] init];
//        goodSetVc.goodPlisName = @"ClasiftyGoods.plist";
//        [self.navigationController pushViewController:goodSetVc animated:YES];
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
        }
//        }else if (indexPath.section == 3){
//            DCYouLikeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID forIndexPath:indexPath];
//            [headerView.likeButton setTitle:@"品牌精选" forState:UIControlStateNormal];
//            [headerView.likeButton setTitleColor:RGB(77, 171, 21) forState:UIControlStateNormal];
//            [headerView.likeButton setImage:[UIImage imageNamed:@"shouye_icon03"] forState:UIControlStateNormal];
//            reusableview = headerView;
//        }else if (indexPath.section == 4){
//            DCYouLikeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID forIndexPath:indexPath];
//            [headerView.likeButton setTitle:@"热门推荐" forState:UIControlStateNormal];
//            [headerView.likeButton setTitleColor:RGB(14, 122, 241) forState:UIControlStateNormal];
//            [headerView.likeButton setImage:[UIImage imageNamed:@"shouye_icon02"] forState:UIControlStateNormal];
//            reusableview = headerView;
//        }
        
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {
            LBSMTopFooterView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TopFooterView forIndexPath:indexPath];
            reusableview = footview;
        }
//        }else if (indexPath.section == 2){
//            DCScrollAdFootView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCScrollAdFootViewID forIndexPath:indexPath];
//            reusableview = footerView;
//        }else if (indexPath.section == 4) {
//            DCOverFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCOverFootViewID forIndexPath:indexPath];
//            reusableview = footview;
//        }
    }
    return reusableview;
}
/// head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        /// 图片滚动的宽高
        return CGSizeMake([UIScreen cz_screenWidth], 150);
    }
    if (section == 1 ||section == 3 || section == 4) {
        /// 猜你喜欢的宽高
        /// 推荐适合的宽高
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
//    if (section == 2) {
//        return CGSizeMake(ScreenW, 80); // 滚动广告
//    }
//    if (section == 4) {
//        return CGSizeMake(ScreenW, 40); // 结束
//    }
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
