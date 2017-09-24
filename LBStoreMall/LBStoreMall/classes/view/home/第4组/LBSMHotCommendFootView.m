//
//  LBSMHotCommendFootView.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHotCommendFootView.h"
@interface LBSMHotCommendFootView ()
/// 文字
@property (strong , nonatomic)UILabel *label;
@end

@implementation LBSMHotCommendFootView
/// 构造器
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}
/// 简单布局
- (void)setUpUI
{
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
    _label.font = LBSMFont(16);
    _label.font = [UIFont systemFontOfSize:13];
    _label.textColor = [UIColor darkGrayColor];
    _label.text = @"没有更多商品";
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}

@end
