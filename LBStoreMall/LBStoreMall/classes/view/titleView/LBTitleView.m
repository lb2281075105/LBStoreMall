//
//  LBTitleView.m
//  LBStoreMall
//
//  Created by liubo on 2018/3/29.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import "LBTitleView.h"
#import "LBSMSearchTextField.h"
@implementation LBTitleView
{
    LBSMSearchTextField *_searchTf;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    /// 需要添加x y
    _searchTf = [[LBSMSearchTextField alloc]initWithFrame:CGRectMake(0,0,[UIScreen cz_screenWidth] - 120,35) withTitle:@" 618 100元红包等你来抢" withBool:true];
    [self addSubview:_searchTf];
    _searchTf.backgroundColor = [UIColor cz_colorWithHex:0xcf3441];
    [_searchTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@([UIScreen cz_screenWidth] - 120));
        make.height.equalTo(@(35));
    }];
    /// 右边的按钮
    _searchTf.rightBtnClickBlock = ^{
        LBSMLog(@"右边点击");
    };
    /// 编辑按钮
    _searchTf.searchBlock = ^{
        LBSMLog(@"点击textF");
    };

}
- (CGSize)intrinsicContentSize{
    return UILayoutFittingExpandedSize;
}
@end
