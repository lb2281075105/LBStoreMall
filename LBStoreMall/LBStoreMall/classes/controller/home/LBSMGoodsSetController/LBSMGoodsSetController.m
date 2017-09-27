//
//  LBSMGoodsSetController.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMGoodsSetController.h"
#import "LBSMSearchTextField.h"
@interface LBSMGoodsSetController ()
/// 切换视图按钮
@property (strong , nonatomic)UIButton *switchButton;
/// 查找商品
@property (strong , nonatomic)LBSMSearchTextField *searchTf;
/// 0：列表视图，1：格子视图
@property (nonatomic, assign) BOOL isSwitchGrid;
@end

@implementation LBSMGoodsSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置导航
    [self setUpNav];
    /// 设置基本信息
    [self setUpInfo];
    
    
}
- (void)setUpInfo{
    // 默认列表视图
    _isSwitchGrid = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = LBSMColor(245, 245, 245);
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
@end
