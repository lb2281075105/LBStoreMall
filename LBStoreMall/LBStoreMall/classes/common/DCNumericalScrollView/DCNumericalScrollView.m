//
//  DCNumericalScrollView.m
//  CDDMall
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//
#define BtnTag      1000

#import "DCNumericalScrollView.h"

@interface DCNumericalScrollView()

@property (nonatomic , strong) NSMutableArray *btnArray;

@end

@implementation DCNumericalScrollView

#pragma mark - initizlize
- (instancetype)initWithFrame:(CGRect)frame andImage:(NSString *)imageName andDataTArray:(NSArray *)titlesArray WithDataIArray:(NSArray *)imagesTitlesArray{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:imageName];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:self.imageView];
        
        //图片的约束
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        
        //创建Button
        if (titlesArray.count>0) {
            for (int i = 0; i < titlesArray.count ; i++) {
                //文字Button
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.tag = BtnTag + i;
                [btn setTitle:titlesArray[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                btn.titleLabel.font = LBSMFont(13);
                //图片Button
                UIButton *imagesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [imagesBtn setTitle:imagesTitlesArray[i] forState:UIControlStateNormal];
                imagesBtn.backgroundColor = [UIColor redColor];
                imagesBtn.titleLabel.font = LBSMFont(10);
                [btn addSubview:imagesBtn];
                
                if (i != 0) {
                    CATransform3D trans = CATransform3DIdentity;
                    trans = CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
                    trans = CATransform3DTranslate(trans, 0, - self.frame.size.height/2, -self.frame.size.height/2);
                    btn.layer.transform = trans;
                }else{
                    CATransform3D trans = CATransform3DIdentity;
                    trans = CATransform3DMakeRotation(0, 1, 0, 0);
                    trans = CATransform3DTranslate(trans, 0, 0, - self.frame.size.height/2);
                    btn.layer.transform = trans;
                }
                [self addSubview:btn];
                [self.btnArray addObject:btn];
                
                //约束
                [imagesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    [make.left.mas_equalTo(self.imageView.mas_right)setOffset:10];
                    make.centerY.mas_equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(45, 15));
                }];
                
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    [make.left.mas_equalTo(imagesBtn.mas_right)setOffset:10];
                    make.centerY.mas_equalTo(self);
                    make.right.mas_equalTo(self);
                    make.height.mas_equalTo(self).multipliedBy(0.8);
                }];
            }
        }
        
    }
    return self;
}
- (NSMutableArray *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

#pragma mark - 开始
- (void)startTimer{
    if (!self.interval) {
        self.interval = 5;
    }
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.interval target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}
#pragma mark - 滚动
- (void)timerRun{
    
    if (self.btnArray.count >1) {
        [UIView animateWithDuration:self.interval/self.interval animations:^{
            
            UIButton *btn = self.btnArray[0];
            CATransform3D trans = CATransform3DIdentity;
            trans = CATransform3DMakeRotation(-M_PI_2, 1, 0, 0);
            trans = CATransform3DTranslate(trans, 0, self.frame.size.height/2, - self.frame.size.height/2);
            btn.layer.transform = trans;
            
            
            UIButton *btn1 = self.btnArray[1];
            CATransform3D trans1 = CATransform3DIdentity;
            trans1 = CATransform3DMakeRotation(0, 1, 0, 0);
            trans1 = CATransform3DTranslate(trans1, 0, 0, 0);
            btn1.layer.transform = trans1;
            
        } completion:^(BOOL finished) {
            
            if (finished == YES) {
                UIButton *btn = self.btnArray[0];
                CATransform3D trans = CATransform3DIdentity;
                trans = CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
                trans = CATransform3DTranslate(trans, 0, - self.frame.size.height/2, - self.frame.size.height/2);
                btn.layer.transform = trans;
                
                [self.btnArray addObject:btn];
                [self.btnArray removeObjectAtIndex:0];
            }
        }];
        
    }
    
}

#pragma mark - 点击事件
- (void)btnAction:(UIButton *)sender{
    NSInteger tag = sender.tag - BtnTag;
    if ([self.delegate respondsToSelector:@selector(noticeViewSelectNoticeActionAtIndex:)]) {
        [self.delegate noticeViewSelectNoticeActionAtIndex:tag];
    }
}

@end
