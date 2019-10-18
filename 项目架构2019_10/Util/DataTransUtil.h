//
//  DataTransUtil.h
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/10/27.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTransUtil : NSObject

+(NSString*)getYearAndMoonAndDayWithHengXianFormat:(NSString*)dateString; //时间(2017-11-21 09:05:16) 转换成 2017-10-30

+(NSString*)getYearAndMoonAndDayWithXieXianFormat:(NSString*)dateString; //时间(2017-11-21 09:05:16) 转换成 2017/10/30

+(NSString *)timeWithTimeIntervalString:(NSString *)timeString; //时间戳(1507624134) 转换成 2017-10-30 17:30
+(NSString *)timeWith_Y_M_D_TimeIntervalString:(NSString *)timeString; //时间戳(1507624134) 转换成 2017-10-30
+(NSString *)timeWith_Y_M_D_H_m_s_TimeIntervalString:(NSString *)timeString; //时间戳(1507624134) 转换成 2017-10-30 10:50:02
+(NSString*)getTimeStringWithFormatter:(NSString *)formatStr dateTime:(NSString*)dateString; //传入相应的时间格式
+(NSString*)getTimeStringWithFormatter:(NSString *)formatStr withTimeinterval:(NSString *)timeinterval;   //根据时间戳 设置相应格式
+(NSString *)getMoneyFormatter:(double)money; ////整数最少位数1 //小数位最多位数4 //小数位最少位数0

@end
