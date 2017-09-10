//
//  LBSMHeader.h
//  LBStoreMall
//
//  Created by liubo on 2017/9/10.
//  Copyright © 2017年 liubo. All rights reserved.
//

///宏定义

///判断是不是开发、调试状态，如果是开发、调试状态，就让LBNCLog替换NSLog
#ifdef DEBUG
///LBNCLog是不限制参数的，中间用三个英文句号表示
#define LBNCLog(...) NSLog(__VA_ARGS__)
///如果是发布状态LBNCLog就直接为空
#define kHeight [UIScreen cz_screenHeight] / 750.0
//标题字体
#define kTitleFont      [UIFont systemFontOfSize:15]
//子标题字体
#define kSubtitleFont      [UIFont systemFontOfSize:13]
//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
//应用程序的屏幕高度
#define kWindowH        [UIScreen mainScreen].bounds.size.height
//应用程序的屏幕宽度
#define kWindowW        [UIScreen mainScreen].bounds.size.width


#elif
#define LBNCLog(...)
#endif

