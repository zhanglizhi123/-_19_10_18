//
//  MineHttpTool.h
//  EasyClub
//
//  Created by zhao on 2019/5/30.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineHttpTool : NSObject
/** 1)
 用户登录 POST
 url+ /easyclub/user/login
 "regType": 必: 登录方式 1.密码 2.验证码
 "telephone":必: 手机号码,
 "password": 密码
 "regCode":  验证码
 
 */
+(void)loginWithRegType:(NSNumber *)regType
              telephone:(NSString *)telephone
               password:(NSString *)password
                regCode:(NSString *)regCode
                success:(void(^)(id result))success
                failure:(void(^)(NSInteger code,NSString *desc))failure;




@end

/*
 跟新日志 19年-9月-18日
 ---------为了首页默认数据更改的--------
 >>>>>>>>>>>>>>>
 1.轮播  common/bannerList
 2.获取最新版本号  sign/version
 3. 省份城市所有数据三级  common/areaAll
 4.首页文章  apparticle/articleList
 5.首页文章插入活动。apparticle/artAndAct
 ===============
 1.轮播  apphomepage/bannerList
 2.获取最新版本号  apphomepage/version
 3. 省份城市所有数据三级  apphomepage/areaAll
 4.首页文章  apphomepage/articleList
 5.首页文章插入活动。apphomepage/artAndAc
<<<<<<<<<<<<<<<<<
 */
/*
 apparticle/addReadCount 改为 apphomepage/addReadCount
 association/findAssList 改为 apphomepage/findAssList
 */
NS_ASSUME_NONNULL_END
