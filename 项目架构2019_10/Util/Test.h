//
//  Test.h
//  EasyClub
//
//  Created by zhao on 2019/5/16.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject
+ (instancetype)sharedInstance;

-(void)saveInfo:(NSString *)string key:(NSString *)key;
-(void)deleInfo:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
