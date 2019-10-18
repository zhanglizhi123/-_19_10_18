//
//  LoginMiMaBkgView.h
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LoginMiMaKind) {
    LoginMiMaKind_wangji,
    LoginMiMaKind_qiehuan,
    LoginMiMaKind_login,
};
@interface LoginMiMaBkgView : UIView
@property(nonatomic,copy) void(^JumpBlock)(LoginMiMaKind type);

@property(nonatomic,strong) UITextField *userTF, *yanNumTF;
@property(nonatomic,strong) UIImageView *userImgv, *yzmImgv;
@property(nonatomic,strong) UIButton *wangjiBtn, *denluBtn, *qihuanBtn;
@property(nonatomic,strong) UIView *line_one_view, *line_two_view;

@end

NS_ASSUME_NONNULL_END
