//
//  MBProgressHUD+ZLZ.m
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/13.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "MBProgressHUD+ZLZ.h"

@implementation MBProgressHUD (ZLZ)

- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay action:(void(^)(void))action{
    [self hideAnimated:animated afterDelay:delay];
    if (action == nil) {
        action = ^{};
    }
    //hud隐藏动画是0.3秒
    if (animated) {
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay + 0.3 * NSEC_PER_SEC));
        dispatch_after(when, dispatch_get_main_queue(), action);
    }else{
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay + 0.1 * NSEC_PER_SEC));
        dispatch_after(when, dispatch_get_main_queue(), action);
    }
}
-(void)showSuccess:(NSString*)successDesc action:(void(^)(void))action{
    UIImage *image = [UIImage imageNamed:@"check_mark"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.mode = MBProgressHUDModeCustomView;
    self.customView = imageView;
    self.label.text = successDesc;
    [self hide:YES afterDelay:0.75f action:action];
    
}

-(void)showFailure:(NSString*)failureDesc action:(void(^)(void))action{
    UIImage *image = [UIImage imageNamed:@"error_mark"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.mode = MBProgressHUDModeCustomView;
    self.customView = imageView;
    self.label.text = failureDesc;
    [self hide:YES afterDelay:1.25f action:action];
}

//-(void)showOnlyText:(NSString*)content action:(void(^)(void))action{
//    self.mode = MBProgressHUDModeCustomView;
//    self.customView = nil;
//    self.label.text = content;
//    [self hide:YES afterDelay:0.75 action:action];
//}

-(void)showTextOnly:(NSString *)message action:(void(^)(void))action{
    self.bezelView.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.8];
    self.mode = MBProgressHUDModeText;
    self.label.text = message;
    self.label.textColor = [UIColor whiteColor];
    self.label.numberOfLines = 3;
    self.label.font = [UIFont systemFontOfSize:15];
    self.margin = 10;
    [self hideAnimated:YES afterDelay:1.25];
    if (action == nil) {
        action = ^{};
    }
    //hud隐藏动画是0.3秒
    if (action == nil) {
        action = ^{};
    }

    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 + 0.1 * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), action);
}

/** 自定义加载动画 */
+(MBProgressHUD *)showText:(NSString *)textTip showImagesToView:(UIView *)view
{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows firstObject];
    }
    // 如果之前有hud，先隐藏之前的hud
    [self hideHUDForView:view animated:NO];
    // 快速显示一个提示信息`
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.backgroundColor = k_page_bkg_color;
    //使用多图片
    NSMutableArray *imgArr = [NSMutableArray array];
    UIImage *img;
    for (int i = 1; i<=13; i++) {
        img = [UIImage imageNamed:[NSString stringWithFormat:@"jiazai_animate_%d",i]];
        [imgArr addObject:img];
    }
    UIImageView *custImageV = [[UIImageView alloc] initWithImage:img];
    custImageV.animationImages = imgArr;
    custImageV.animationDuration = 0.5;
    custImageV.animationRepeatCount = 0;
    [custImageV startAnimating];
    hud.customView = custImageV;
    hud.detailsLabel.text = textTip;
    hud.detailsLabel.font = [UIFont systemFontOfSize:12];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.minSize = CGSizeMake(90, 60);
    [hud.bezelView setStyle:MBProgressHUDBackgroundStyleSolidColor];
    [hud.bezelView setColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0f]];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
    
}

@end
