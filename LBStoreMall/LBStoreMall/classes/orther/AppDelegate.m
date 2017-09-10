//
//  AppDelegate.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/10.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "AppDelegate.h"
#import "LBSMTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight])];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[LBSMTabBarController alloc]init];
    return YES;
}
@end
