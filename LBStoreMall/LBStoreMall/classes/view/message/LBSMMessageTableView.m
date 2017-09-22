//
//  LBSMMessageTableView.m
//  LBStoreMall
//
//  Created by yunmei on 2017/9/22.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMMessageTableView.h"
#import "LBSMMessageCell.h"
@implementation LBSMMessageTableView

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(void)setMessageArray:(NSMutableArray *)messageArray{

    _messageArray = messageArray;
    [self reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LBSMMessageCell *cell = [LBSMMessageCell cellWithTableView:tableView];
    cell.model = self.messageArray[indexPath.row];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}


@end
