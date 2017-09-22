//
//  LBSMMessageCell.h
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSMMessageModel.h"
@interface LBSMMessageCell : UITableViewCell
+ cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) LBSMMessageModel *model;
@end
