//
//  ZLZUserDefaultUtil.h
//  MiDouShu
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLZUserDefaultUtil : NSObject
//token
+(void)storeZXSToken:(NSString*)token;
+(NSString*)getZXSToken;
+(void)removeZXSToken;
//IMToken
+(void)storeIMToken:(NSString*)token;
+(NSString*)getIMToken;
+(void)removeIMToken;

//简单储存字符串
+(void)storeKey:(NSString *)key value:(NSString*)value;
+(NSString*)getValueWithKey:(NSString *)key;
+(void)removeValueWithKey:(NSString *)key;

//写入归档 NSKeyedArchiver NSKeyedUnarchiver
+(void)storeArchiverKeyPath:(NSString *)keyPath value:(id)value;  //keyPath = @"Midou.text"
+(id)getArchiverValueWithKeyPath:(NSString *)keyPath;
+(void)removeArchiverValueWithKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
