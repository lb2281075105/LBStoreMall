//
//  LBSMTopFooterView.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMTopFooterView.h"
@interface LBSMTopFooterView ()

/// 滚动
@property (strong , nonatomic)DCNumericalScrollView *numericalScrollView;
/// 底部
@property (strong , nonatomic)UIView *bottomLineView;

@end
@implementation LBSMTopFooterView
/// 构造器
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        /// 布局
        [self setUpUI];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpUI
{
    NSArray *titles = @[@"LBStoreMall首单新人礼~",
                        @"github你值得拥有，欢迎点赞~",
                        @"项目持续更新中~"];
    NSArray *btnts = @[@"新人礼",
                       @"github",
                       @"点赞"];
    /// 初始化
    _numericalScrollView = [[DCNumericalScrollView alloc]initWithFrame:CGRectMake(0, 0, self.dc_width, self.dc_height) andImage:@"shouye_img_toutiao" andDataTArray:titles WithDataIArray:btnts];
    _numericalScrollView.delegate = self;
    /// 设置定时器多久循环
    _numericalScrollView.interval = 5;
    [self addSubview:_numericalScrollView];
    /// 开始循环
    [_numericalScrollView startTimer];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = LBSMColor(245, 245, 245);
    [self addSubview:_bottomLineView];
    _bottomLineView.frame = CGRectMake(0, self.dc_height - 8, [UIScreen cz_screenWidth], 8);
}
/// 滚动条点击事件
- (void)noticeViewSelectNoticeActionAtIndex:(NSInteger)index{
    NSLog(@"点击了第 %zd 个头条滚动条",index);
}

@end
