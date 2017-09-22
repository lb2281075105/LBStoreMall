//
//  DCNumericalScrollView.h
//  CDDMall
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoticeViewDelegate <NSObject>

- (void)noticeViewSelectNoticeActionAtIndex:(NSInteger)index;

@end

@interface DCNumericalScrollView : UIView


/**
 图片
 */
@property (nonatomic , strong) UIImageView *imageView;

/**
 定时器的循环时间
 */
@property (nonatomic , assign) NSInteger interval;

@property (nonatomic , assign) id<NoticeViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andImage:(NSString *)imageName andDataTArray:(NSArray *)titlesArray WithDataIArray:(NSArray *)imagesTitlesArray;

/**
 创建定时器并run
 */
- (void)startTimer;



@end
