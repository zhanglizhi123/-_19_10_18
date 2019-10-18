//
//  RegistBkgView.m
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "RegistBkgView.h"
@interface RegistBkgView ()
@property(strong,nonatomic) NSTimer *timer;
@property(assign,nonatomic) NSInteger countdown;
@property(nonatomic,strong) UIButton *selectBtn, *jumpfwBtn;
@property(nonatomic,strong) UIImageView *selectImgv;
@property(nonatomic,strong) UILabel *fwInfoL;
@property(nonatomic,assign) BOOL n_is_fw;

@end

@implementation RegistBkgView


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
    //获取验证码
    self.yzMaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.yzMaBtn];
    self.yzMaBtn.titleLabel.font = TEXT_LIT_S_FONT13;
    [self.yzMaBtn setTitleColor:k_main_bar_color forState:UIControlStateNormal];
    [self.yzMaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_one_view.mas_bottom).mas_offset(11);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.size.mas_equalTo(CGSizeMake(75, 25));
    }];
    [self.yzMaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.yzMaBtn addTarget:self action:@selector(clickedHuoquyzm:) forControlEvents:UIControlEventTouchUpInside];
    //下缝隙
    self.yzmImgv = [[UIImageView alloc]init];
    self.yzmImgv.userInteractionEnabled = YES;
    self.yzmImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.yzmImgv];
    [self.yzmImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_one_view.mas_bottom).mas_offset(14);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.yzmImgv.image = [UIImage imageNamed:@"shouji_login"];
    
    self.yanNumTF = [[UITextField alloc]init];
    [self addSubview:self.yanNumTF];
    self.yanNumTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.yanNumTF.backgroundColor = [UIColor clearColor];
    self.yanNumTF.placeholder = @"请输入验证码";
    self.yanNumTF.tintColor = k_abstract_color;
    self.yanNumTF.textColor = k_title_color;
    self.yanNumTF.font = TEXT_LIT_S_FONT13;
    [self.yanNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_one_view.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.yzmImgv.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.yzMaBtn.mas_left).mas_offset(-5);
        make.height.mas_equalTo(25);
    }];
    self.line_two_view = [[UIView alloc]init];
    self.line_two_view.userInteractionEnabled = YES;
    self.line_two_view.backgroundColor = k_line_bkg_e6_color;
    [self addSubview:self.line_two_view];
    [self.line_two_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yanNumTF.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.yzmImgv.mas_left);
        make.right.mas_equalTo(self.yzMaBtn.mas_right);
        make.height.mas_equalTo(1);
    }];
    
   //输入密码
    self.mimaImgv = [[UIImageView alloc]init];
    self.mimaImgv.userInteractionEnabled = YES;
    self.mimaImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.mimaImgv];
    [self.mimaImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_two_view.mas_bottom).mas_offset(14);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.mimaImgv.image = [UIImage imageNamed:@"login_mima"];
    
    self.mimaTF = [[UITextField alloc]init];
    [self addSubview:self.mimaTF];
    self.mimaTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.mimaTF.backgroundColor = [UIColor clearColor];
    self.mimaTF.placeholder = @"请输入密码";
    self.mimaTF.tintColor = k_abstract_color;
    self.mimaTF.textColor = k_title_color;
    self.mimaTF.font = TEXT_LIT_S_FONT13;
    [self.mimaTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_two_view.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.mimaImgv.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.height.mas_equalTo(25);
    }];
    self.line_three_view = [[UIView alloc]init];
    self.line_three_view.userInteractionEnabled = YES;
    self.line_three_view.backgroundColor = k_line_bkg_e6_color;
    [self addSubview:self.line_three_view];
    [self.line_three_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mimaTF.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.mimaImgv.mas_left);
        make.right.mas_equalTo(self.mimaTF.mas_right);
        make.height.mas_equalTo(1);
    }];
    //再次输入密码
    self.qurenImgv = [[UIImageView alloc]init];
    self.qurenImgv.userInteractionEnabled = YES;
    self.qurenImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.qurenImgv];
    [self.qurenImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_three_view.mas_bottom).mas_offset(14);
        make.left.mas_equalTo(self.mas_left).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.qurenImgv.image = [UIImage imageNamed:@"login_mima"];
    
    self.qurenTF = [[UITextField alloc]init];
    [self addSubview:self.qurenTF];
    self.qurenTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.qurenTF.backgroundColor = [UIColor clearColor];
    self.qurenTF.placeholder = @"请再次输入密码";
    self.qurenTF.tintColor = k_abstract_color;
    self.qurenTF.textColor = k_title_color;
    self.qurenTF.font = TEXT_LIT_S_FONT13;
    [self.qurenTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_three_view.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.qurenImgv.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
        make.height.mas_equalTo(25);
    }];
    
    self.line_four_view = [[UIView alloc]init];
    self.line_four_view.userInteractionEnabled = YES;
    self.line_four_view.backgroundColor = k_line_bkg_e6_color;
    [self addSubview:self.line_four_view];
    [self.line_four_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.qurenTF.mas_bottom).mas_offset(11);
        make.left.mas_equalTo(self.qurenImgv.mas_left);
        make.right.mas_equalTo(self.qurenTF.mas_right);
        make.height.mas_equalTo(1);
    }];
    //注册
    self.zhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.zhuceBtn];
    self.zhuceBtn.titleLabel.font = TEXT_MIDD_S_FONT16;
    [self.zhuceBtn setBackgroundImage:[UIImage imageNamed:@"login_dl"] forState:UIControlStateNormal];
    self.zhuceBtn.backgroundColor = [UIColor clearColor];
    [self.zhuceBtn setTitleColor:k_white_color forState:UIControlStateNormal];
    [self.zhuceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_four_view.mas_bottom).mas_offset(80);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40*2, (SCREEN_WIDTH-60*2)*(44/258.0)));
    }];
    [self.zhuceBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.zhuceBtn addTarget:self action:@selector(clickedZhuce:) forControlEvents:UIControlEventTouchUpInside];
    
    [self drawFuwuView];
//    //按钮
//    self.dengluBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self addSubview:self.dengluBtn];
//    self.dengluBtn.backgroundColor = [UIColor whiteColor];
//    self.dengluBtn.titleLabel.font = TEXT_LIT_S_FONT13;
//    [self.dengluBtn setTitleColor:k_main_bar_color forState:UIControlStateNormal];
//    [self.dengluBtn setTitle:@"已有账号？请直接登录" forState:UIControlStateNormal];
//    self.dengluBtn.layer.borderColor = k_main_bar_color.CGColor;
//    self.dengluBtn.layer.borderWidth = 1;
//    self.dengluBtn.layer.cornerRadius = (SCREEN_WIDTH-40*2)*(44/258.0)/2.0;
//    [self.dengluBtn addTarget:self action:@selector(clickedLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.dengluBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.zhuceBtn.mas_bottom).mas_offset(20);
//        make.left.mas_equalTo(self.mas_left).mas_offset(40);
//        make.right.mas_equalTo(self.mas_right).mas_offset(-40);
//        make.height.mas_equalTo((SCREEN_WIDTH-40*2)*(44/258.0));
//    }];
}

-(void)drawFuwuView{
    self.selectImgv = [[UIImageView alloc]init];
    [self addSubview:self.selectImgv];
    self.selectImgv.userInteractionEnabled = YES;
    self.selectImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self.selectImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.line_four_view.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.qurenImgv.mas_left);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    self.selectImgv.backgroundColor = [UIColor clearColor];
    self.selectImgv.image = [UIImage imageNamed:@"login_unselect"];

    //作者
    self.fwInfoL = [[UILabel alloc]init];
    self.fwInfoL.font = TEXT_LIT_S_FONT11;
    self.fwInfoL.textColor = k_title_color;
    [self addSubview:self.fwInfoL];
    self.fwInfoL.text = @"已阅读并同意";
    [self.fwInfoL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.selectImgv.mas_centerY);
        make.left.mas_equalTo(self.selectImgv.mas_right).mas_offset(4);
    }];
    self.fwInfoL.numberOfLines = 1;
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.selectBtn];
    [self.selectBtn addTarget:self action:@selector(clickedSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.selectImgv.mas_left).mas_offset(-10);
        make.right.mas_equalTo(self.fwInfoL.mas_right).mas_offset(1);
        make.top.mas_equalTo(self.selectImgv.mas_top).mas_offset(-4);
        make.bottom.mas_equalTo(self.selectImgv.mas_bottom).mas_offset(4);
    }];
    
    //jump
    self.jumpfwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.jumpfwBtn];
    self.jumpfwBtn.backgroundColor = [UIColor clearColor];
    self.jumpfwBtn.titleLabel.font = TEXT_LIT_S_FONT11;
    [self.jumpfwBtn setTitleColor:[UIColor colorWithHexString:@"#349fef" alpha:1.0] forState:UIControlStateNormal];
    [self.jumpfwBtn setTitle:@"《用户服务协议》" forState:UIControlStateNormal];
    [self.jumpfwBtn addTarget:self action:@selector(goToFuWuXieyi:) forControlEvents:UIControlEventTouchUpInside];
    [self.jumpfwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.selectImgv.mas_centerY);
        make.left.mas_equalTo(self.fwInfoL.mas_right).mas_offset(2);
        make.size.mas_equalTo(CGSizeMake(100, 14));
    }];
    
}

//获取验证码
-(void)clickedHuoquyzm:(UIButton *)sender{

    if ([sender.titleLabel.text isEqualToString:@"获取验证码"]) {
        self.countdown = self.limit_num==0 ? 60 : self.limit_num;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTimeSendInfo:) userInfo:nil repeats:YES];
        //调用获取验证码的接口
        if (self.JumpBlock) {
            self.JumpBlock(RegistKind_yzm);
        }
    }
}

-(void)countTimeSendInfo:(id)sender{
    if (self.countdown > 0) {
        self.countdown--;
        
        [self.yzMaBtn setTitle:[NSString stringWithFormat:@"%ld s",self.countdown] forState:UIControlStateNormal];
        
        self.yzMaBtn.userInteractionEnabled = NO;
    }else{
        //如果时间到了改变button状态
        [self.timer invalidate];
        self.yzMaBtn.userInteractionEnabled = YES;
        [self.yzMaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}
-(void)resetTimeNum{
    [self.timer invalidate];
    self.yzMaBtn.userInteractionEnabled = YES;
    [self.yzMaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
}

//注册
-(void)clickedZhuce:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(RegistKind_zhuce);
    }
}
//登录
-(void)clickedLoginBtn:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(RegistKind_login);
    }
}
//选择阅读
-(void)clickedSelectBtn:(UIButton *)sender{
    self.n_is_fw = !self.n_is_fw;
    [self showIsSelect:self.n_is_fw];
}
//服务协议
-(void)goToFuWuXieyi:(UIButton *)sender{
    if (self.JumpBlock) {
        self.JumpBlock(RegistKind_Jump_fw);
    }
}

//#3EAFFC
-(void)setIsSelect:(BOOL)isSelect{
    self.n_is_fw = isSelect;
    [self showIsSelect:isSelect];
}
-(BOOL)isSelect{
    return self.n_is_fw;
}

-(void)showIsSelect:(BOOL)isSelect{
    if (isSelect) {
        self.selectImgv.image = [UIImage imageNamed:@"login_select"];
    } else {
        self.selectImgv.image = [UIImage imageNamed:@"login_unselect"];
    }
}

@end
