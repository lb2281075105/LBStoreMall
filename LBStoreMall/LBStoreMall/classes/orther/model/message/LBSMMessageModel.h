//
//  LBSMMessageModel.h
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBSMMessageModel : NSObject
/// 标题
@property (nonatomic, copy , readonly) NSString *title;
/// 图片
@property (nonatomic, copy , readonly) NSString *imageName;
/// 消息
@property (nonatomic, copy , readonly) NSString *message;
@end
