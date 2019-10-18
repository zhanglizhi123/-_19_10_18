//
//  LoginTelBkgView.h
//  EasyClub
//
//  Created by zhao on 2019/4/19.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LoginTelKind) {
    LoginTelKind_yzm,
    LoginTelKind_qiehuan,
    LoginTelKind_login,
};
@interface LoginTelBkgView : UIView
@property(nonatomic,copy) void(^JumpBlock)(LoginTelKind type);

@property(nonatomic,strong) UITextField *userTF, *yanNumTF;
@property(nonatomic,strong) UIImageView *userImgv, *yzmImgv;
@property(nonatomic,strong) UIButton *yzMaBtn, *denluBtn, *qihuanBtn;
@property(nonatomic,strong) UIView *line_one_view, *line_two_view;

@property(nonatomic,assign) NSInteger limit_num;

-(void)resetTimeNum;
@end

NS_ASSUME_NONNULL_END
