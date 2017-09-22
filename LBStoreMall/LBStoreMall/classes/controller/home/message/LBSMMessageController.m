//
//  LBSMMessageController.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMMessageController.h"
#import <MJExtension.h>
#import "LBSMMessageModel.h"
#import "LBSMMessageTableView.h"

@interface LBSMMessageController ()

@property (nonatomic, strong) LBSMMessageModel *messageModel;
@property (nonatomic, strong) NSMutableArray<LBSMMessageModel *> *messageArrays;
@property (nonatomic, strong) LBSMMessageTableView *messageTableView;
@end

@implementation LBSMMessageController

- (NSMutableArray *)messageArrays{

    if (_messageArrays == nil) {
        _messageArrays = [[NSMutableArray alloc]init];
    }
    return _messageArrays;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = LBSMColor(245, 245, 245);
    
    [self messageTableView];
    /// 获取数据
    [self addData];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == LBSMColor(245, 245, 245))return;
    self.navigationController.navigationBar.barTintColor = LBSMColor(245, 245, 245);
}
/// 懒加载
-(LBSMMessageTableView *)messageTableView{

    if(_messageTableView == nil){
        _messageTableView = [[LBSMMessageTableView alloc]init];
        _messageTableView.backgroundColor = LBSMColor(245, 245, 245);
        [self.view addSubview:_messageTableView];
        [_messageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.top.equalTo(@69);
        }];
    }
    return _messageTableView;
}
- (void)addData{
     /// plist 文件转化为 model数组
     _messageArrays = [LBSMMessageModel mj_objectArrayWithFilename:@"MessageNote.plist"];
     self.messageTableView.messageArray = _messageArrays;
}


@end
