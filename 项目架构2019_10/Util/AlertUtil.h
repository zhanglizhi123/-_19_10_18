//
//  AlertUtil.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/18.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject
+(void)alert:(NSString*)content inViewController:(UIViewController*)viewController;

+(void)alert:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler;

+(void)alertWithCancel:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler;
+(void)alertBack:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler;

@end
