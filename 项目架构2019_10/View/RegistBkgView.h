//
//  RegistBkgView.h
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, RegistKind) {
    RegistKind_yzm,
    RegistKind_zhuce,
    RegistKind_login,
    RegistKind_Jump_fw,
    RegistKind_choose_fw,
};
@interface RegistBkgView : UIView
@property(nonatomic,copy) void(^JumpBlock)(RegistKind type);

@property(nonatomic,strong) UITextField *userTF, *yanNumTF, *mimaTF, *qurenTF;
@property(nonatomic,strong) UIImageView *userImgv, *yzmImgv, *mimaImgv, *qurenImgv;
@property(nonatomic,strong) UIButton *yzMaBtn, *zhuceBtn, *dengluBtn;
@property(nonatomic,strong) UIView *line_one_view, *line_two_view, *line_three_view, *line_four_view;

@property(nonatomic,assign) NSInteger limit_num;
@property(nonatomic,assign) BOOL isSelect;


-(void)resetTimeNum;

@end

NS_ASSUME_NONNULL_END
