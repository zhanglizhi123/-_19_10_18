//
//  MBProgressHUD+ZLZ.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/13.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (ZLZ)
-(void)showSuccess:(NSString*)successDesc action:(void(^)(void))action;

-(void)showFailure:(NSString*)failureDesc action:(void(^)(void))action;

//-(void)showOnlyText:(NSString*)content action:(void(^)(void))action;

-(void)showTextOnly:(NSString *)message action:(void(^)(void))action;

/** 自定义加载动画 */
+(MBProgressHUD *)showText:(NSString *)textTip showImagesToView:(UIView *)view;

@end
