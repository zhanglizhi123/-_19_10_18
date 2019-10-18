//
//  AlertUtil.m
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/18.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil
+(void)alert:(NSString*)content inViewController:(UIViewController*)viewController{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
}

+(void)alert:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
        [alertController addAction:okAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
}

+(void)alertWithCancel:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
}
+(void)alertBack:(NSString*)content inViewController:(UIViewController*)viewController withHandler:(void(^)(id result))handler{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:handler];
        [alertController addAction:okAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    });
}

@end
