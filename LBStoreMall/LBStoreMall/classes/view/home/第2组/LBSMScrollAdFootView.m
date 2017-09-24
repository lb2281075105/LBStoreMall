//
//  LBSMScrollAdFootView.m
//  LBStoreMall
//
//  Created by liubo on 2017/9/24.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBSMScrollAdFootView.h"
@interface LBSMScrollAdFootView ()<SDCycleScrollViewDelegate>
/// 轮播图
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;
@end

@implementation LBSMScrollAdFootView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], self.dc_height) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 5.0;
    _cycleScrollView.imageURLStringsGroup = @[@"http://gfs4.gomein.net.cn/T1DZAvBQbg1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1CoJvBXV_1RCvBVdK.jpg",@"http://gfs3.gomein.net.cn/T1C.EvBjJ_1RCvBVdK.jpg"];
    
    [self addSubview:_cycleScrollView];
}

/// 点击广告跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%zd广告图",index);
}

/// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
