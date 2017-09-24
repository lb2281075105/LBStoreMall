//
//  LBSMPinPaiHeaderView.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMPinPaiHeaderView.h"

@implementation LBSMPinPaiHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    _pinPaiButton = [LBSMPinPaiButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_pinPaiButton];
}
/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_pinPaiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
