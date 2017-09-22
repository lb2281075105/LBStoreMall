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
@interface LBSMHomeController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/// 滑动视图
@property (strong , nonatomic)UICollectionView *collectionView;
/// 搜索
@property (strong , nonatomic)LBSMSearchTextField *searchTf;
/// 九宫格
@property (strong , nonatomic)NSMutableArray *homeGridArray;

@end
//// cell
static NSString *const HomeGridCell = @"LBSMHomeGridCell";
static NSString *const DCExceedApplianceCellID = @"DCExceedApplianceCell";
/* head */
static NSString *const DCSlideshowHeadViewID = @"DCSlideshowHeadView";

/* foot */
static NSString *const DCTopLineFootViewID = @"DCTopLineFootView";

@implementation LBSMHomeController

- (UICollectionView *)collectionView{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, 64, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight] - 64 - 49);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        /// cell九宫格
        [_collectionView registerClass:[LBSMHomeGridCell class] forCellWithReuseIdentifier:HomeGridCell];

        /// header
        
        
        /// footer
        
        
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
    [self.collectionView reloadData];
}
/// 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) { //10属性
        return _homeGridArray.count;
    }
//    if (section == 1) { //倒计时
//        return 1;
//    }
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
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0) {//10
        LBSMHomeGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeGridCell forIndexPath:indexPath];
        cell.homeGrid = _homeGridArray[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        gridcell = cell;
    }
 
    return gridcell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//9宫格组
        return CGSizeMake([UIScreen cz_screenWidth]/5 , [UIScreen cz_screenWidth]/5 + 10);
    }
//    if (indexPath.section == 1) {//计时
//        return CGSizeMake(ScreenW, 150);
//    }
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
