//
//  Test.m
//  EasyClub
//
//  Created by zhao on 2019/5/16.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "Test.h"

@implementation Test
+ (instancetype)sharedInstance
{
    static id shared_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared_instance = [[self alloc] init];
    });
    return shared_instance;
}
-(void)saveInfo:(NSString *)string key:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *tmp = [string dataUsingEncoding:NSUTF8StringEncoding];
    [ud setObject:tmp forKey:key];
    [ud synchronize];
}
-(void)deleInfo:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
