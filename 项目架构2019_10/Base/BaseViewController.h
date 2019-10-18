//
//  BaseViewController.h
//  MiDouShu
//
//  Created by mac on 2018/11/13.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : ViewController
/**
 返回按钮
 */
@property (nonatomic ,strong) UIBarButtonItem *backButtonItem;
/**
 默认为NO 设置YES不能侧滑返回
 */
@property (nonatomic, assign) BOOL isPopEnable;
/**
 默认为NO 设置YES不显示返回按钮  一级页面本身就不显示返回按钮
 */
@property (nonatomic, assign) BOOL isHiddenBackItem;

- (void)loadUI;

-(void)loginInUpdata;
-(void)loginOutPage;
-(void)showPageInfo:(BOOL)isHiden message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
