//
//  HttpServiceTool.h
//  MiDouShu
//
//  Created by mac on 2018/11/14.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpServiceTool : NSObject
//不用获取token
+(void)requestUnTokenPageWithUrl:(NSString*)url
                          params:(NSDictionary*)params
                         success:(void(^)(id json))success
                         failure:(void(^)(NSInteger code,NSString *desc))failure;

//post待token访问
+(void)requestWithUrl:(NSString*)url
               params:(NSDictionary*)params
              success:(void(^)(id json))success
              failure:(void(^)(NSInteger code,NSString *desc))failure;
//不用获取token
+(void)requestGETUnTokenPageWithUrl:(NSString*)url
                          params:(NSDictionary*)params
                         success:(void(^)(id json))success
                         failure:(void(^)(NSInteger code,NSString *desc))failure;
//get待token访问
+(void)requestGETWithUrl:(NSString*)url
               params:(NSDictionary*)params
              success:(void(^)(id json))success
              failure:(void(^)(NSInteger code,NSString *desc))failure;

//put待token访问
+(void)requestPUTWithUrl:(NSString*)url
                  params:(NSDictionary*)params
                 success:(void(^)(id json))success
                 failure:(void(^)(NSInteger code,NSString *desc))failure;

//不用获取token上传文件
+(void)uploadUnTokenWithUrl:(NSString *)url
                     params:(NSDictionary *)params
                      files:(NSArray<NSData*>*)files
                   fileName:(NSString *)fileName
                   progress:(void(^)(NSInteger progress))progress
                    success:(void (^)(id json))success
                    failure:(void (^)(NSInteger code, NSString *desc))failure;

////正文上传文件使用token  //弃用扩展差使用下面的
//+(void)uploadWithUrl:(NSString *)url
//              params:(NSDictionary *)params
//               files:(NSArray<NSData*>*)files
//            progress:(void(^)(NSInteger progress))progress
//             success:(void (^)(id json))success
//             failure:(void (^)(NSInteger code, NSString *desc))failure;


#pragma mark -- 统一上传文件接口，限定不多于2个文件上传 （1，2个文件）--
//正文上传文件使用token
+(void)uploadToServiceWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                    fileName1:(NSString*)fileName1
                    fileName2:(NSString*)fileName2
                       files1:(NSArray<NSData*>*)files1
                       files2:(NSArray<NSData*>*)files2
                     progress:(void(^)(NSInteger progress))progress
                      success:(void (^)(id json))success
                      failure:(void (^)(NSInteger code, NSString *desc))failure;

@end

NS_ASSUME_NONNULL_END
