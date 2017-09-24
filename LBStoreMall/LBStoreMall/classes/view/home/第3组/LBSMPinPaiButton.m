//
//  LBSMPinPaiButton.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMPinPaiButton.h"

@implementation LBSMPinPaiButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.dc_centerX = self.dc_width * 0.55;
    self.imageView.dc_x = self.titleLabel.dc_x - self.imageView.dc_width - 5;
}

@end
