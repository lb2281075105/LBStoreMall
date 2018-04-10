//
//  LBSMGoodCustionHeadView.h
//  LBStoreMall
//
//  Created by liubo on 2018/4/9.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSMGoodCustionHeadView : UICollectionReusableView
// 筛选点击回调
@property (nonatomic, copy) dispatch_block_t filtrateClickBlock;
@end
