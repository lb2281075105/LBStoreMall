//
//  LBSMNavController.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/12.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMNavController.h"

@interface LBSMNavController ()

@end

@implementation LBSMNavController

/// 只走一次
+ (void)initialize{

    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = LBSMColor(245,245,245);
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor clearColor]];
    /// 设置导航栏字体颜色
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:LBSMFont(18)};

}
- (void)viewDidLoad {
    [super viewDidLoad];
    /// 手势返回
    [GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    LBSMLog(@"%ld",self.childViewControllers.count);
    if (self.childViewControllers.count >= 1) {
        /// 返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(navBackClick)];
        /// 影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    /// 跳转
    [super pushViewController:viewController animated:animated];
}
/// 导航返回
- (void)navBackClick{
    [self popViewControllerAnimated:YES];
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
