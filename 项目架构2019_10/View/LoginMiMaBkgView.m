


//
//  LoginMiMaBkgView.m
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "LoginMiMaBkgView.h"

@implementation LoginMiMaBkgView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        [self creatView];
    }
    return self;
}

-(void)creatView{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH-20*2,  SCREEN_WIDTH-20*2);
    self.backgroundColor = [UIColor whiteColor];
    
    
    //用户
    self.userImgv = [[UIImageView alloc]init];
    self.userImgv.userInteractionEnabled = YES;
    self.userImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.userImgv];
    [self.userImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(40);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.userImgv.image = [UIImage imageNamed:@"login_user"];
    
    self.userTF = [[UITextField alloc]init];
    [self addSubview:self.userTF];
    self.userTF.backgroundColor = [UIColor clearColor];
    self.userTF.placeholder = @"请输入手机号";
    self.userTF.tintColor = k_abstract_color;
    self.userTF.textColor = k_title_color;
    self.userTF.font = TEXT_LIT_S_FONT13;
    self.userTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.userImgv.mas_centerY);
        make.left.mas_equalTo(self.userImgv.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.height.mas_equalTo(25);
    }];
    self.line_one_view = [[UIView alloc]init];
    self.line_one_view.userInteractionEnabled = YES;
    self.line_one_view.backgroundColor = k_line_bkg_e6_color;
    [self addSubview:self.line_one_view];
    [self.line_one_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userTF.mas_bottom).mas_offset(8);
        make.left.mas_equalTo(self.userImgv.mas_left);
        make.right.mas_equalTo(self.userTF.mas_right);
        make.height.mas_equalTo(1);
    }];

    //下缝隙
    self.yzmImgv = [[UIImageView alloc]init];
    self.yzmImgv.userInteractionEnabled = YES;
    self.yzmImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.yzmImgv];
    [self.yzmImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_one_view.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.yzmImgv.image = [UIImage imageNamed:@"login_mima"];
    
    self.yanNumTF = [[UITextField alloc]init];
    [self addSubview:self.yanNumTF];
    self.yanNumTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.yanNumTF.backgroundColor = [UIColor clearColor];
    self.yanNumTF.placeholder = @"请输入密码";
    self.yanNumTF.tintColor = k_abstract_color;
    self.yanNumTF.textColor = k_title_color;
    self.yanNumTF.font = TEXT_LIT_S_FONT13;
    [self.yanNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_one_view.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.yzmImgv.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.height.mas_equalTo(25);
    }];
    self.line_two_view = [[UIView alloc]init];
    self.line_two_view.userInteractionEnabled = YES;
    self.line_two_view.backgroundColor = k_line_bkg_e6_color;
    [self addSubview:self.line_two_view];
    [self.line_two_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yanNumTF.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.yzmImgv.mas_left);
        make.right.mas_equalTo(self.yanNumTF.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    //切换
    self.qihuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.qihuanBtn];
    self.qihuanBtn.titleLabel.font = TEXT_LIT_S_FONT13;
    [self.qihuanBtn setTitleColor:k_title_color forState:UIControlStateNormal];
    [self.qihuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_two_view.mas_bottom).mas_offset(30);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.size.mas_equalTo(CGSizeMake(105, 25));
    }];
    [self.qihuanBtn setTitle:@"手机验证码登录" forState:UIControlStateNormal];
    [self.qihuanBtn addTarget:self action:@selector(clickedQiehuan:) forControlEvents:UIControlEventTouchUpInside];
    
    //忘记密码？
    self.wangjiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.wangjiBtn];
    self.wangjiBtn.titleLabel.font = TEXT_LIT_S_FONT13;
    [self.wangjiBtn setTitleColor:k_mainGray_color forState:UIControlStateNormal];
    [self.wangjiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_two_view.mas_bottom).mas_offset(30);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(75, 25));
    }];
    [self.wangjiBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.wangjiBtn addTarget:self action:@selector(clickedWangjimima:) forControlEvents:UIControlEventTouchUpInside];
    
    //按钮
    self.denluBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.denluBtn];
    self.denluBtn.backgroundColor = [UIColor clearColor];
    self.denluBtn.titleLabel.font = TEXT_MIDD_S_FONT16;
    [self.denluBtn setTitleColor:k_white_color forState:UIControlStateNormal];
    [self.denluBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.denluBtn setBackgroundImage:[UIImage imageNamed:@"login_dl"] forState:UIControlStateNormal];
    
    [self.denluBtn addTarget:self action:@selector(clickedLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.denluBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_two_view.mas_bottom).mas_offset(100);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60*2, (SCREEN_WIDTH-60*2)*(44/258.0)));
    }];
}

//获取验证码
-(void)clickedWangjimima:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(LoginMiMaKind_wangji);
    }
}

//切换
-(void)clickedQiehuan:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(LoginMiMaKind_qiehuan);
    }
}
//登录
-(void)clickedLoginBtn:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(LoginMiMaKind_login);
    }
}


@end
