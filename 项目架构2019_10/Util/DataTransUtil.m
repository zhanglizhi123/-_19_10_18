//
//  DataTransUtil.m
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/27.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "DataTransUtil.h"

@implementation DataTransUtil

+(NSString*)getYearAndMoonAndDayWithHengXianFormat:(NSString*)dateString{
    NSDateFormatter *formatter1 = [NSDateFormatter new];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter *formatter2 = [NSDateFormatter new];
    [formatter2 setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [formatter1 dateFromString:dateString];
    return [formatter2 stringFromDate:date];
}

+(NSString*)getYearAndMoonAndDayWithXieXianFormat:(NSString*)dateString{
    NSDateFormatter *formatter1 = [NSDateFormatter new];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter *formatter2 = [NSDateFormatter new];
    [formatter2 setDateFormat:@"yyyy/MM/dd"];
    
    NSDate *date = [formatter1 dateFromString:dateString];
    return [formatter2 stringFromDate:date];
}
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+(NSString *)timeWith_Y_M_D_TimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
//时间戳(1507624134) 转换成 2017-10-30 10:50:02
+(NSString *)timeWith_Y_M_D_H_m_s_TimeIntervalString:(NSString *)timeString{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+(NSString*)getTimeStringWithFormatter:(NSString *)formatStr dateTime:(NSString*)dateString{
    NSDateFormatter *formatter1 = [NSDateFormatter new];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter *formatter2 = [NSDateFormatter new];
    [formatter2 setDateFormat:formatStr];
    
    NSDate *date = [formatter1 dateFromString:dateString];
    return [formatter2 stringFromDate:date];
}

+(NSString*)getTimeStringWithFormatter:(NSString *)formatStr withTimeinterval:(NSString *)timeinterval{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeinterval doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
/**
 原文：https://blog.csdn.net/feng_da_ge/article/details/78060936
 0.000000000000001 double失真 9.96 和 9.960000000000001
 */
//将小数转化数字格式，取消掉小数位无用的0。如果你不需要，可以跳过
+ (NSString *)getMoneyFormatter:(double)money {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    numberFormatter.numberStyle = kCFNumberFormatterNoStyle;
    //整数最少位数
    numberFormatter.minimumIntegerDigits = 1;
    //小数位最多位数
    numberFormatter.maximumFractionDigits = 4;
    //小数位最少位数
    numberFormatter.minimumFractionDigits = 0;
    NSString *newAmount = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:money]];
    return newAmount;
}

@end
