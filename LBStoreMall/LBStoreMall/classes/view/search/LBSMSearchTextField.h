//
//  LBSMSearchTextField.h
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSMSearchTextField : UITextField<UITextFieldDelegate>
/// 语音点击回调Block
@property (nonatomic, copy) dispatch_block_t rightBtnClickBlock;
/// 搜索 
@property (nonatomic, copy) dispatch_block_t searchBlock;

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBool:(BOOL)orTrue;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) BOOL orTrue;

@end
