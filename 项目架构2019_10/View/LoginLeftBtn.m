//
//  LoginLeftBtn.m
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "LoginLeftBtn.h"

@implementation LoginLeftBtn
#pragma mark ---- Init
- (instancetype)init {
    if (self = [super init]) {
        [self setSubViews];
    }
    return self;
}
#pragma mark ---- Public
#pragma mark ---- Event Response
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self sendActionsForControlEvents:90];
}

#pragma mark ---- UI
- (void)setSubViews {
    self.layer.cornerRadius = adp(3.f);
    self.frame = CGRectMake(0, 7, 75, 30);
    self.backgroundColor = [UIColor clearColor];
    
    self.leftIcon = [[UIImageView alloc]init];
    self.leftIcon.image = [UIImage imageNamed:@"login_back"];
    self.leftIcon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.leftIcon];
    
    self.nameL = [[UILabel alloc]init];
    self.nameL.text = @"返回";
    self.nameL.font = TEXT_LIT_S_FONT12;
    self.nameL.textColor = k_title_color;
    [self addSubview:self.nameL];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.leftIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(9,9));
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];

    [self.nameL mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIcon.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_lessThanOrEqualTo(self.mas_right).mas_offset(-5);
    }];
}
@end
