//
//  LoginRightBtn.m
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "LoginRightBtn.h"

@implementation LoginRightBtn

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        [self creatView];
    }
    return self;
}

-(void)creatView{
    self.frame = CGRectMake(0, 0, 60,25);
    self.backgroundColor = [UIColor clearColor];
    
    self.registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.registBtn];
    self.registBtn.titleLabel.font = TEXT_LIT_S_FONT12;
    [self.registBtn setTitleColor:k_main_bar_color forState:UIControlStateNormal];
    self.registBtn.layer.borderColor = k_main_bar_color.CGColor;
    self.registBtn.layer.borderWidth = 1;
    self.registBtn.layer.cornerRadius = 24/2.0;
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.top);
        make.left.mas_equalTo(self.mas_left);
        make.size.mas_equalTo(CGSizeMake(60, 24));
    }];
    [self.registBtn setTitle:@"创建账号" forState:UIControlStateNormal];
    [self.registBtn addTarget:self action:@selector(clickedRegister:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickedRegister:(UIButton *)btn{
    if (self.JumpBlock) {
        self.JumpBlock(0);
    }
}
@end
