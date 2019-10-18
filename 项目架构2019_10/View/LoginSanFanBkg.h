//
//  LoginSanFanBkg.h
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnumHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginSanFanBkg : UIView
@property(nonatomic,copy) void(^JumpBlock)(login_sanfang_type type);

@property(nonatomic,strong) UILabel *nameL;
//@property(nonatomic,strong) UIImageView *line_left, *line_right;
@property(nonatomic,strong) UIButton *wxBtn, *wbBtn, *qqBtn;

@end

NS_ASSUME_NONNULL_END
