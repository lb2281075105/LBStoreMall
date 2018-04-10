//
//  LBSMGoodListCollectionCell.h
//  LBStoreMall
//
//  Created by liubo on 2017/9/27.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSMGoodListCommend.h"
@interface LBSMGoodListCollectionCell : UICollectionViewCell
// 推荐数据
@property (strong , nonatomic)LBSMGoodListCommend *goodListCommend;
// 冒号点击回调
@property (nonatomic, copy) dispatch_block_t colonClickBlock;
@end
