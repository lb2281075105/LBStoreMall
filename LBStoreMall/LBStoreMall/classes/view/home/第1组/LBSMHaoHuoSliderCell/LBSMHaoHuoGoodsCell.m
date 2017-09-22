//
//  LBSMHaoHuoGoodsCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMHaoHuoGoodsCell.h"
@interface LBSMHaoHuoGoodsCell ()

/// 图片
@property (strong , nonatomic)UIImageView *goodsImageView;
/// 价格
@property (strong , nonatomic)UILabel *priceLabel;
/// 剩余
@property (strong , nonatomic)UILabel *stockLabel;
/// 属性
@property (strong , nonatomic)UILabel *natureLabel;

@end
@implementation LBSMHaoHuoGoodsCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

/// 布局
- (void)setUpUI
{
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodsImageView];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = LBSMFont(12);
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_priceLabel];
    
    _stockLabel = [[UILabel alloc] init];
    _stockLabel.textColor = [UIColor darkGrayColor];
    _stockLabel.font = LBSMFont(10);
    _stockLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_stockLabel];
    
    _natureLabel = [[UILabel alloc] init];
    _natureLabel.textAlignment = NSTextAlignmentCenter;
    _natureLabel.backgroundColor = [UIColor redColor];
    _natureLabel.font = LBSMFont(10);
    _natureLabel.textColor = [UIColor whiteColor];
    [_goodsImageView addSubview:_natureLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(self.dc_width * 0.8);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
    [_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_priceLabel.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
    [_natureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_goodsImageView.mas_bottom);
        make.left.mas_equalTo(_goodsImageView);
        make.size.mas_equalTo(CGSizeMake(30, 15));
    }];
}


- (void)setModel:(LBSMHaoHuoGoodsModel *)model
{
    _model = model;
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    _priceLabel.text = ([model.price integerValue] >= 10000) ? [NSString stringWithFormat:@"¥ %.2f万",[model.price floatValue] / 10000.0] : [NSString stringWithFormat:@"¥ %.2f",[model.price floatValue]];
    _stockLabel.text = [NSString stringWithFormat:@"仅剩：%@件",model.stock];
    _natureLabel.text = model.nature;
}

@end
