//
//  LBSMSearchTextField.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMSearchTextField.h"

@implementation LBSMSearchTextField{

    UIButton *_rightBtn;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews{
    
    /// 设置圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(2, 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    self.placeholder = @" 618 100元红包等你来抢";
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    /// 搜索按钮
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.with.equalTo(@20);
        make.right.equalTo(self).offset(-5);
    }];
}
- (void)rightButtonClick{
//    !_searchViewBlock ?: _searchViewBlock();
    if (_rightBtnClickBlock) {
        _rightBtnClickBlock();
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    if (_searchBlock) {
        _searchBlock();
    }
}
@end
