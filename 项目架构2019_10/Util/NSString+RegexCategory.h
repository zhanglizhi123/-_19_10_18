//
//  NSString+RegexCategory.h
//  MiDouShu
//
//  Created by mac on 2019/2/19.
//  Copyright © 2019 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RegexCategory)
- (BOOL)isValidateByRegex:(NSString *)regex;
//手机号分服务商
- (BOOL)isMobileNumberClassification;
/**
 *手机号有效性
 *  手机号以13、15、18、170开头，8个 \d 数字字符
 *  小灵通 区号：010,020,021,022,023,024,025,027,028,029 还有未设置的新区号xxx
 */
- (BOOL)isMobileNumber;

//邮箱
- (BOOL)isEmailAddress;

//身份证号
- (BOOL) simpleVerifyIdentityCardNum;

//车牌
- (BOOL)isCarNumber;

@end

NS_ASSUME_NONNULL_END
