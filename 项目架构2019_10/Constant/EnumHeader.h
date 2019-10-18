//
//  EnumHeader.h
//  EasyClub
//
//  Created by zhao on 2019/4/24.
//  Copyright © 2019 zhang. All rights reserved.
//

#ifndef EnumHeader_h
#define EnumHeader_h

//三方登录
typedef NS_ENUM(NSUInteger, login_sanfang_type) {
    login_sanfang_type_wb,
    login_sanfang_type_wx,
    login_sanfang_type_qq,
};

//分享按钮
typedef NS_ENUM(NSUInteger, WenZhangShareType) {
    WenZhangShareType_WX,
    WenZhangShareType_Pyq,
};

#endif /* EnumHeader_h */
