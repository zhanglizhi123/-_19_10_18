//
//  SelectGenderPickerViewController.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/11/7.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "PickerBaseViewController.h"
@class SelectGenderPickerViewController;
@protocol GenderPickerVCDelegate <NSObject>
-(void)genderPicker:(SelectGenderPickerViewController*)genderPicker
    selectedGernder:(NSString*)gender;
@end
@interface SelectGenderPickerViewController : PickerBaseViewController
@property (nonatomic, weak) id<GenderPickerVCDelegate> delegate;

@end
