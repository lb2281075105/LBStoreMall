//
//  LBSMPinPaiJingXuanCell.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMPinPaiJingXuanCell.h"

@interface LBSMPinPaiJingXuanCell ()

/// 图片
@property (strong , nonatomic)UIImageView *imageView;
@end

@implementation LBSMPinPaiJingXuanCell

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
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_imageView];
}

/// 简单布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
}
@end

