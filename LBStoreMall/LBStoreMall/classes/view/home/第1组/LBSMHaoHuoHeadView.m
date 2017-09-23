//
//  LBSMHaoHuoHeadView.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHaoHuoHeadView.h"
#import "LBSMHaoGoodsButton.h"
@interface LBSMHaoHuoHeadView ()
/// 红色块
@property (strong , nonatomic)UIView *redView;
/// 时间
@property (strong , nonatomic)UILabel *timeLabel;
/// 倒计时
@property (strong , nonatomic)UILabel *countDownLabel;
/// 好货秒抢
@property (strong , nonatomic)LBSMHaoGoodsButton *rightButton;
@end

@implementation LBSMHaoHuoHeadView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    _redView = [[UIView alloc] init];
    _redView.backgroundColor = [UIColor redColor];
    [self addSubview:_redView];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = @"6点场";
    _timeLabel.font = LBSMFont(16);
    [self addSubview:_timeLabel];
    
    _countDownLabel = [[UILabel alloc] init];
    _countDownLabel.textColor = [UIColor redColor];
    _countDownLabel.text = @"05 : 58 : 33";
    _countDownLabel.font = LBSMFont(14);
    [self addSubview:_countDownLabel];
    /// 右边的按钮
    _rightButton = [LBSMHaoGoodsButton buttonWithType:UIButtonTypeCustom];
    _rightButton.titleLabel.font = LBSMFont(12);
    [_rightButton setImage:[UIImage imageNamed:@"shouye_icon_jiantou"] forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_rightButton setTitle:@"好货秒抢" forState:UIControlStateNormal];
    [self addSubview:_rightButton];
    
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _redView.frame = CGRectMake(0, 10, 8, 20);
    _timeLabel.frame = CGRectMake(20, 0, 60, self.dc_height);
    _countDownLabel.frame = CGRectMake(CGRectGetMaxX(_timeLabel.frame), 0, 100, self.dc_height);
    _rightButton.frame = CGRectMake(self.dc_width - 70, 0, 70, self.dc_height);

}

@end
