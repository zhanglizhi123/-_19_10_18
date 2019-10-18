//
//  PickerBaseViewController.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/11/7.
//  Copyright © 2017年 zlz. All rights reserved.
//
// UIPickerView 样式的弹出
#import <UIKit/UIKit.h>

@interface PickerBaseViewController : UIViewController
// 设置中间title
@property(nonatomic,copy) NSString *pickerTitle;
// pickerview
@property (strong, nonatomic) UIPickerView *pickView;
// 数据源
@property(nonatomic,strong) NSArray<NSMutableArray*> *dataArray;
// 取消
-(void)cancleAction;
// 确认
-(void)ensureAction;
@end
