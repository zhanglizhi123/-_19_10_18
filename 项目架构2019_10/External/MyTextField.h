//
//  MyTextField.h
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/8/17.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextField : UITextField

@property(nonatomic,copy) void(^textClickBlock)(id type);

@end
