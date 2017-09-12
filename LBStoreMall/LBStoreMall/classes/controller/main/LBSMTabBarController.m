//
//  LBSMTabBarController.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/10.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMTabBarController.h"
#import "LBSMTabBar.h"
#import "LBSMHomeController.h"
#import "LBSMMineController.h"
#import "LBSMShopController.h"
#import "LBSMClassifyController.h"
#import "LBSMNavController.h"
@interface LBSMTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) LBSMTabBar *lbsmTabBar;
@end

@implementation LBSMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 更改系统tabbar(可改，可不改) --- MARK
    // [self modifyTabBar];
    // 添加子控制器
    [self addChildViewControllers];
    
    // 设置代理
    self.delegate = self;
    
}
// 更改系统tabbar
- (void)modifyTabBar{

    _lbsmTabBar = [[LBSMTabBar alloc]init];
    _lbsmTabBar.backgroundColor = [UIColor redColor];
    // KVC把系统换成自定义LBSMTabBar
    [self setValue:_lbsmTabBar forKey:@"tabBar"];
}
// 添加子控制器
- (void)addChildViewControllers{
    ///首页
    [self addChildViewController:[[LBSMHomeController alloc]init] withNormalImage:@"tabr_01_up" withSelectImage:@"tabr_01_down" withTitle:@"首页"];
    ///分类
    [self addChildViewController:[[LBSMClassifyController alloc]init] withNormalImage:@"tabr_02_up" withSelectImage:@"tabr_02_down" withTitle:@"分类"];
    ///购物车
    [self addChildViewController:[[LBSMShopController alloc]init] withNormalImage:@"tabr_04_up" withSelectImage:@"tabr_04_down" withTitle:@"购物车"];
    ///我的
    [self addChildViewController:[[LBSMMineController alloc]init] withNormalImage:@"tabr_05_up" withSelectImage:@"tabr_05_down" withTitle:@"我的"];
}
///添加子控制器
- (void)addChildViewController:(UIViewController *)childController withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage withTitle:(NSString *)title{
    // childController.tabBarItem.image
    // childController.tabBarItem.title
    // childController.navigationItem.title
    
    if ([title containsString:@"购物车"]) {
        // 标签栏和导航栏都会显示标题
        // childController.title = title;
        childController.navigationItem.title = title;
    }
    LBSMNavController *nav = [[LBSMNavController alloc]initWithRootViewController:childController];
    nav.tabBarItem.image = [[UIImage imageNamed:normalImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ///（当只有图片的时候）需要自动调整
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);

    [self addChildViewController:nav];
}
// 代理方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    // 点击了那个index
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    LBSMLog(@"%lu",(unsigned long)self.selectedIndex);
    return tabBarButton;
}
// 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{   // tabBarButton 上面有图片和title
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            // 需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            // 添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

// 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}
@end
