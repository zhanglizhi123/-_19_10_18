//
//  DataBase64Util.h
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/8/17.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase64Util : NSObject
//64编码
+ (NSString *)encode:(NSString *)string;
//64解码
+ (NSString *)dencode:(NSString *)base64String;

@end
