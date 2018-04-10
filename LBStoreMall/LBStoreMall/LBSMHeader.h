//
//  LBSMHeader.h
//  LBStoreMall
//
//  Created by liubo on 2017/9/10.
//  Copyright © 2017年 liubo. All rights reserved.
//

///宏定义

///判断是不是开发、调试状态，如果是开发、调试状态，就让LBSMLog替换NSLog
#ifdef DEBUG
///LBSMLog是不限制参数的，中间用三个英文句号表示
#define LBSMLog(...) NSLog(__VA_ARGS__)
///如果是发布状态LBNCLog就直接为空
#define kHeight [UIScreen cz_screenHeight] / 750.0
//标题字体
#define LBSMFont(font)      [UIFont systemFontOfSize:font]
#define LBSMMargin 10

//通过RGB设置颜色
#define LBSMColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

//应用程序的屏幕高度
#define kWindowH        [UIScreen mainScreen].bounds.size.height
//应用程序的屏幕宽度
#define kWindowW        [UIScreen mainScreen].bounds.size.width
//数组
#define NeedLifeArray  @[@"http://gfs8.gomein.net.cn/T1TkDvBK_j1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1loYvBCZj1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg",@"http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1L.VvBCxv1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1joLvBKhT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1AoVvB7_v1RCvBVdK.jpg"];
/// 品牌精选
#define PinPaiImagesArray  @[@"http://gfs1.gomein.net.cn/T1koKvBT_g1RCvBVdK.jpg",@"http://gfs3.gomein.net.cn/T1n5JvB_Eb1RCvBVdK.jpg",@"http://gfs10.gomein.net.cn/T1jThTB_Ls1RCvBVdK.jpeg",@"http://gfs7.gomein.net.cn/T1T.YvBbbg1RCvBVdK.jpg",@"http://gfs6.gomein.net.cn/T1toCvBKKT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1JZLvB4Jj1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1JZLvB4Jj1RCvBVdK.jpg",@"http://gfs3.gomein.net.cn/T1ckKvBTW_1RCvBVdK.jpg",@"http://gfs.gomein.net.cn/T1hNCvBjKT1RCvBVdK.jpg"]
#define cellWH kWindowW * 0.5 - 50
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"

#elif
#define LBSMLog(...)
#endif

