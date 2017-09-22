//
//  LBSMMessageTableView.h
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSMMessageTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageArray;
@end
