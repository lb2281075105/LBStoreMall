//
//  LBSMHomeGridCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHomeGridCell.h"

@implementation LBSMHomeGridCell{
    /// 图片
    UIImageView *_gridImageView;
    /// 标题
    UILabel *_gridLabel;
}
-(void)setHomeGrid:(LBSMHomeGrid *)homeGrid{

    _homeGrid = homeGrid;
    NSLog(@"%@",homeGrid.iconImage);
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:homeGrid.iconImage]];
    _gridLabel.text = homeGrid.gridTitle;
}
/// xxxxx
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
/// 用这个
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 设置布局
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI
{
    _gridImageView = [[UIImageView alloc] init];
    _gridImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_gridImageView];
    
    _gridLabel = [[UILabel alloc] init];
    _gridLabel.font = LBSMFont(13);
    _gridLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_gridLabel];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    /// 图片
    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:10];
        if ([UIScreen cz_screenHeight] == 568) {
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }else{
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }
        make.centerX.mas_equalTo(self);
    }];
    /// 标题
    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(_gridImageView.mas_bottom)setOffset:5];
    }];
}
@end
