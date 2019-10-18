//
//  MineHttpTool.m
//  EasyClub
//
//  Created by zhao on 2019/5/30.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "MineHttpTool.h"
#import <AFNetworking/AFNetworking.h>



@implementation MineHttpTool
/** 1)
 用户登录
 url+ /user/login
 {
 "regType": "b5EZ79lFFz",
 "telephone": "15625234000",
 "password": "123456",
 "regCode": "CBE7stUgR0"
 }
 ****注意**** user---> sign

 */
+(void)loginWithRegType:(NSNumber *)regType
              telephone:(NSString *)telephone
               password:(NSString *)password
                regCode:(NSString *)regCode
                success:(void(^)(id result))success
                failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSMutableDictionary *para =[NSMutableDictionary dictionary];
    
    if (regType !=nil) {
        [para setObject:regType forKey:@"regType"];
    }
    if (telephone.length>0 &&telephone !=nil) {
        [para setObject:telephone forKey:@"telephone"];
    }
    if (password.length>0 &&password !=nil) {
        [para setObject:password forKey:@"password"];
    }
    if (regCode.length>0 &&regCode !=nil) {
        [para setObject:regCode forKey:@"regCode"];
    }
    /*
     SERVICE_HOST  @"http://test.estxy.com/easyclub"  //时候使用 user/login
     SERVICE_HOST  @"http://ass.estxy.com/easyass"  //时候使用 sign/login

     */
//    NSString *url_str= @"user/login";
////#ifdef DEBUG
////    url_str= @"user/login";
////#else
//    url_str= @"sign/login";
////#endif

    [HttpServiceTool requestUnTokenPageWithUrl:@"sign/login" params:para success:^(id json) {
//        LoginModel *model = [LoginModel mj_objectWithKeyValues:json];
//        success(model);
        success(@"1");
    } failure:^(NSInteger code, NSString *desc) {
        failure(code,desc);
    }];
}





@end
