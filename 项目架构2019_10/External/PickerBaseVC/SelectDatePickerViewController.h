//
//  SelectDatePickerViewController.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/11/7.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "PickerBaseViewController.h"
@class SelectDatePickerViewController;

@protocol DatePickerVCDelegate <NSObject>
- (void)datePicker:(SelectDatePickerViewController*)datePicker
          withYear:(NSString *)year
             month:(NSString *)month
               day:(NSString *)day;

@end
@interface SelectDatePickerViewController : PickerBaseViewController
@property (nonatomic, weak) id<DatePickerVCDelegate> delegate;

@end
