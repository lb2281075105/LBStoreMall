//
//  LBSMHaoGoodsButton.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/23.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHaoGoodsButton.h"

@implementation LBSMHaoGoodsButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    /// 设置按钮内部图片和文字的位置
    self.titleLabel.dc_x = 0;
    self.titleLabel.dc_centerY = self.dc_centerY;
    [self.titleLabel sizeToFit];
    self.imageView.dc_x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    self.imageView.dc_centerY = self.dc_centerY;
    [self.imageView sizeToFit];
}

@end
