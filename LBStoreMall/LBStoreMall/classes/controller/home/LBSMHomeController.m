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
@interface LBSMHomeController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/// 滑动视图
@property (strong , nonatomic)UICollectionView *collectionView;
/// 搜索
@property (strong , nonatomic)LBSMSearchTextField *searchTf;


@end

@implementation LBSMHomeController

- (UICollectionView *)collectionView{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, 64, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight] - 64 - 49);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
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
