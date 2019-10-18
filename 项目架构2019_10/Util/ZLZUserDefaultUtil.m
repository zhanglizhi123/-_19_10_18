//
//  ZLZUserDefaultUtil.m
//  MiDouShu
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 zlz. All rights reserved.
//

#import "ZLZUserDefaultUtil.h"

@implementation ZLZUserDefaultUtil

#pragma mark -- token --
+(void)storeZXSToken:(NSString*)token{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *tmp = [token dataUsingEncoding:NSUTF8StringEncoding];
    [ud setObject:tmp forKey:LOGIN_TOKEN_KEY];
    [ud synchronize];
}
+(NSString*)getZXSToken{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [[NSString alloc] initWithData:[ud objectForKey:LOGIN_TOKEN_KEY] encoding:NSUTF8StringEncoding];
}
+(void)removeZXSToken{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LOGIN_TOKEN_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//IMToken
+(void)storeIMToken:(NSString*)token{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *tmp = [token dataUsingEncoding:NSUTF8StringEncoding];
    [ud setObject:tmp forKey:IM_TOKEN_KEY];
    [ud synchronize];
}
+(NSString*)getIMToken{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [[NSString alloc] initWithData:[ud objectForKey:IM_TOKEN_KEY] encoding:NSUTF8StringEncoding];
}
+(void)removeIMToken{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:IM_TOKEN_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//NSUserDefaults 沙盒储存
+(void)storeKey:(NSString *)key value:(NSString*)value{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *tmp = [value dataUsingEncoding:NSUTF8StringEncoding];
    [ud setObject:tmp forKey:key];
    [ud synchronize];
    
//        [ud setObject:value forKey:key];
//        [ud synchronize];
}

+(NSString*)getValueWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [[NSString alloc] initWithData:[ud objectForKey:key] encoding:NSUTF8StringEncoding];
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    return [ud objectForKey:key];
}
+(void)removeValueWithKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if([key isEqualToString:@"user_id"]){
        [[NSNotificationCenter defaultCenter] postNotificationName:Login_Out object:nil];
    }
}


//写入归档
//keyPath = @"Midou.text"
+(void)storeArchiverKeyPath:(NSString *)keyPath value:(NSString*)value{
    NSString * scourcePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path1 = [[scourcePath stringByAppendingPathComponent:@"MiDou"] stringByAppendingPathComponent:keyPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path1]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path1 withIntermediateDirectories:YES attributes:nil error:nil];
    }

    //归档
    if (@available(iOS 11.0, *)) {
        NSData *data1 = [NSKeyedArchiver archivedDataWithRootObject:value requiringSecureCoding:YES error:nil];
        if ([data1 writeToFile:[path1 stringByAppendingString:@"Midou.midou"] atomically:YES]) {
            NSLog(@"arr成功");
        } else {
            NSLog(@"arr失败");
        };
    } else {
        //iOS 11之前
        [NSKeyedArchiver archiveRootObject:value toFile:[path1 stringByAppendingString:@"Midou.midou"]];
    }
}
+(id)getArchiverValueWithKeyPath:(NSString *)keyPath{
    
    NSString * scourcePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path1 = [[scourcePath stringByAppendingPathComponent:@"MiDou"] stringByAppendingPathComponent:keyPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path1]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path1 withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if(@available(iOS 11.0, *)){
        return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:[NSData dataWithContentsOfFile:[path1 stringByAppendingString:@"Midou.midou"] options:NSDataReadingMappedIfSafe error:nil] error:nil];
    }else{
        return [NSKeyedUnarchiver unarchiveObjectWithFile:[path1 stringByAppendingString:@"Midou.midou"]];
    }
}

+(void)removeArchiverValueWithKeyPath:(NSString *)keyPath{
    NSString * scourcePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * path1 = [[scourcePath stringByAppendingPathComponent:@"MiDou"] stringByAppendingPathComponent:keyPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path1]) {
        [[NSFileManager defaultManager] removeItemAtPath:path1 error:nil];
    }
}


@end
