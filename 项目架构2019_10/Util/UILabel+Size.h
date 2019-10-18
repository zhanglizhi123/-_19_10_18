//
//  UILabel+Size.h
//  HiddenPerils
//
//  Created by YJC on 2019/1/8.
//  Copyright © 2019年 KenVin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Size)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;


@end

NS_ASSUME_NONNULL_END
