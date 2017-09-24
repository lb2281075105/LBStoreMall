//
//  LBSMHotCommendCell.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHotCommendCell.h"

@implementation LBSMHotCommendCell

-(void)setHotCommend:(LBSMHotCommend *)hotCommend{

    _hotCommend = hotCommend;
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:hotCommend.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[hotCommend.price floatValue]];
    _goodsLabel.text = hotCommend.main_title;
}
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
    self.backgroundColor = [UIColor whiteColor];
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodsImageView];
    /// 商品名称
    _goodsLabel = [[UILabel alloc] init];
    _goodsLabel.font = LBSMFont(10);
    _goodsLabel.numberOfLines = 2;
    _goodsLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_goodsLabel];
    /// 价格
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = LBSMFont(13);
    [self addSubview:_priceLabel];
    /// 看相似
    _sameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sameButton.titleLabel.font = LBSMFont(10);
    [_sameButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_sameButton setTitle:@"看相似" forState:UIControlStateNormal];
    [_sameButton addTarget:self action:@selector(lookSameGoods) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sameButton];
    [DCSpeedy dc_chageControlCircularWith:_sameButton AndSetCornerRadius:0 SetBorderWidth:1.0 SetBorderColor:[UIColor darkGrayColor] canMasksToBounds:YES];
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(cellWH , cellWH));
        
    }];
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(40);
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:10];
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_goodsImageView);
        make.width.mas_equalTo(self).multipliedBy(0.5);
        make.top.mas_equalTo(_goodsLabel.mas_bottom);
        
    }];
    
    [_sameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-10];
        make.centerY.mas_equalTo(_priceLabel);
        make.size.mas_equalTo(CGSizeMake(35, 18));
    }];
}



/// 点击事件
- (void)lookSameGoods
{
    !_lookSameBlock ? : _lookSameBlock();
}

@end
