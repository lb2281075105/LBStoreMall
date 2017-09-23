//
//  LBSMNeedLifeGoodCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/23.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMNeedLifeGoodCell.h"
@interface LBSMNeedLifeGoodCell ()
/// 图片
@property (strong , nonatomic)UIImageView *imageView;
@end
@implementation LBSMNeedLifeGoodCell
/// 构造器
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        /// 添加
        [self setUpUI];
    }
    return self;
}

/// 添加
- (void)setUpUI
{
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_imageView];
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
/// set 方法
- (void)setImageStr:(NSString *)imageStr
{
    _imageStr = imageStr;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
}
@end
