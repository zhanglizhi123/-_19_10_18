//
//  LoginRightBtn.h
//  EasyClub
//
//  Created by zhao on 2019/4/20.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginRightBtn : UIControl
@property(nonatomic,copy) void(^JumpBlock)(NSInteger type);

@property(nonatomic,strong) UIButton *registBtn;

@end

NS_ASSUME_NONNULL_END
