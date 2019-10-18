//
//  UIColor+HEXColor.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/9.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEXColor)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

//UIColor 转UIImage
+ (UIImage*) imageWithColor: (UIColor*) color;

@end
