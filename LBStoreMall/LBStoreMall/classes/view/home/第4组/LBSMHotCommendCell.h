//
//  LBSMHotCommendCell.h
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSMHotCommend.h"
@interface LBSMHotCommendCell : UICollectionViewCell

@property (nonatomic, strong) LBSMHotCommend *hotCommend;

/// 相同
@property (strong , nonatomic)UIButton *sameButton;
/// 找相似点击回调
@property (nonatomic, copy) dispatch_block_t lookSameBlock;
/// 图片
@property (strong , nonatomic)UIImageView *goodsImageView;
/// 标题
@property (strong , nonatomic)UILabel *goodsLabel;
/// 价格
@property (strong , nonatomic)UILabel *priceLabel;


@end
