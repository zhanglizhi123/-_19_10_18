//
//  LoginSanFanBkg.m
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "LoginSanFanBkg.h"
#import <UMShare/UMShare.h>


@implementation LoginSanFanBkg

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        [self creatView];
    }
    return self;
}

-(void)creatView{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH-20*2, 105);
    self.backgroundColor = [UIColor clearColor];
    
    //名字
    self.nameL = [[UILabel alloc]init];
    [self addSubview:self.nameL];
    self.nameL.font = TEXT_LIT_S_FONT12;
    self.nameL.textColor = k_white_color;
    self.nameL.textAlignment = NSTextAlignmentCenter;
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(30);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(55, 15));
    }];
    self.nameL.text = @"快速登录";
    [self.nameL layoutIfNeeded];
    [self.nameL setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisHorizontal];
    //左线
    UIView *leftVLine = [[UIView alloc]init];
    [self addSubview:leftVLine];
    leftVLine.backgroundColor = k_white_color;
    [leftVLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameL.mas_centerY);
        make.right.mas_equalTo(self.nameL.mas_left).mas_offset(-15);
        make.size.mas_equalTo(CGSizeMake(20, 1));
    }];
    [leftVLine setContentHuggingPriority:800 forAxis:UILayoutConstraintAxisHorizontal];

    //右线
    UIView *rightVLine = [[UIView alloc]init];
    [self addSubview:rightVLine];
    rightVLine.backgroundColor = k_white_color;
    [rightVLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameL.mas_centerY);
        make.left.mas_equalTo(self.nameL.mas_right).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(20, 1));
    }];
    [rightVLine setContentHuggingPriority:800 forAxis:UILayoutConstraintAxisHorizontal];
#warning 微信微博布局更改注释 为了上线微信不开通要求注释调
    //中间微博
    self.wbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.wbBtn];
    self.wbBtn.layer.cornerRadius = 44/2;
    self.wbBtn.tag = 500+login_sanfang_type_wb;
    [self.wbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [self.wbBtn setImage:[UIImage imageNamed:@"weibo_bai"] forState:UIControlStateNormal];
    [self.wbBtn addTarget:self action:@selector(clickedShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    //左侧微信
    self.wxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.wxBtn];
    self.wxBtn.layer.cornerRadius = 44/2;
    self.wxBtn.tag = 500+login_sanfang_type_wx;
    [self.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
        make.right.mas_equalTo(self.wbBtn.mas_left).mas_offset(-20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [self.wxBtn setImage:[UIImage imageNamed:@"weixin_bai"] forState:UIControlStateNormal];
    [self.wxBtn addTarget:self action:@selector(clickedShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //右侧q qQQ
    self.qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.qqBtn];
    self.qqBtn.layer.cornerRadius = 44/2;
    self.qqBtn.tag = 500+login_sanfang_type_qq;
    [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
        make.left.mas_equalTo(self.wbBtn.mas_right).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [self.qqBtn setImage:[UIImage imageNamed:@"QQ_bai"] forState:UIControlStateNormal];
    [self.qqBtn addTarget:self action:@selector(clickedShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    
//    //以下是为了上线修改更新的约束
//    [self.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
//        make.centerX.mas_equalTo(self.mas_centerX);
//        make.size.mas_equalTo(CGSizeMake(44, 44));
//    }];
//    [self.wbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
//        make.right.mas_equalTo(self.wxBtn.mas_left).mas_offset(-20);
//        make.size.mas_equalTo(CGSizeMake(44, 44));
//    }];
//    [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
//        make.left.mas_equalTo(self.wxBtn.mas_right).mas_offset(20);
//        make.size.mas_equalTo(CGSizeMake(44, 44));
//    }];
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        NSLog(@"yes");
        [self.wbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.wbBtn setImage:[UIImage imageNamed:@"weibo_bai"] forState:UIControlStateNormal];
        //左侧微信
        [self.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.right.mas_equalTo(self.wbBtn.mas_left).mas_offset(-20);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.wxBtn setImage:[UIImage imageNamed:@"weixin_bai"] forState:UIControlStateNormal];
        
        //右侧q qQQ
        [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.left.mas_equalTo(self.wbBtn.mas_right).mas_offset(20);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.qqBtn setImage:[UIImage imageNamed:@"QQ_bai"] forState:UIControlStateNormal];

    }else{
        NSLog(@"NO");
        //以下是为了上线修改更新的约束
        [self.wxBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.wxBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];

        [self.wbBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.right.mas_equalTo(self.wxBtn.mas_left).mas_offset(-20);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.wbBtn setImage:[UIImage imageNamed:@"weibo_bai"] forState:UIControlStateNormal];

        [self.qqBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(30);
            make.left.mas_equalTo(self.wxBtn.mas_right).mas_offset(20);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [self.qqBtn setImage:[UIImage imageNamed:@"QQ_bai"] forState:UIControlStateNormal];

    }
}
-(void)clickedShareBtn:(UIButton *)sender{
//    [self QQLogin];
    login_sanfang_type tag_num = sender.tag - 500;
    if (self.JumpBlock) {
        self.JumpBlock(tag_num);
    }
    
}







@end
