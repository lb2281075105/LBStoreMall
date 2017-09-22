//
//  LBSMMessageCell.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMMessageCell.h"

@implementation LBSMMessageCell{
        /// 标题Label
        UILabel *_titleLabel;
        /// 图片
        UIImageView *_imageNameView;
        /// 消息
        UILabel *_messageLabel;
        /// 底部分割线
        UIView *_cellLine;
}
+ cellWithTableView:(UITableView *)tableView{

    LBSMMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBSMMessageCell"];
    if (cell == nil) {
        cell = [[LBSMMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBSMMessageCell"];
    }
    return cell;
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
        
    }
    return self;
}
-(void)setModel:(LBSMMessageModel *)model{

    _model = model;
    _titleLabel.text = model.title;
    _imageNameView.image = [UIImage imageNamed:model.imageName];
    _messageLabel.text = model.message;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        /// 布局
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews{
    
    /// 标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = LBSMFont(14);
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:64];
        [make.right.mas_equalTo(self)setOffset:-10];
        [make.top.mas_equalTo(self)setOffset:10];
    }];
    
    /// 消息
    _messageLabel = [[UILabel alloc] init];
    _messageLabel.font = LBSMFont(13);
    _messageLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:_messageLabel];
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        [make.top.mas_equalTo(_titleLabel.mas_bottom)setOffset:5];
    }];
    
    /// 图片
    _imageNameView = [[UIImageView alloc] init];
    [self addSubview:_imageNameView];
    [_imageNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:10];
        [make.top.mas_equalTo(self)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(44, 44));
        
    }];
    /// 分割线
    _cellLine = [[UIView alloc] init];
    _cellLine.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
    [self addSubview:_cellLine];
    [_cellLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
   
}
/// 布局(布局之前要把控件加载cell上面了)
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    [_imageNameView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.size.mas_equalTo(CGSizeMake(44, 44));
//        
//    }];
//}
@end
