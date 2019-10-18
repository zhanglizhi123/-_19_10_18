//
//  HttpServiceTool.m
//  MiDouShu
//
//  Created by mac on 2018/11/14.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "HttpServiceTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation HttpServiceTool
//不用获取token
+(void)requestUnTokenPageWithUrl:(NSString*)url
                          params:(NSDictionary*)params
                         success:(void(^)(id json))success
                         failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    //////这个项目易社团的Java后台的 请求形式AFJSONRequestSerializer
    //.serialization.response Code=-1011 "Request failed: bad request (400)" UserInfo={NSLocalizedDescription=Request failed: bad request (400),
    //Content-Type application/json;charset=utf-8
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
      BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];

    //        NSLog(@"model ____ %@",model);
        if (model.code == 1000) {

            success(model.data);
            } else {
                failure(model.code, model.message);
            }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        } else if(error.code == -1009){
            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
            failure(error.code, @"网络异常，请稍后重试");
        } else {
            failure(error.code, @"系统内部错误");
        }
    }];
}

//post待token访问
+(void)requestWithUrl:(NSString*)url
               params:(NSDictionary*)params
              success:(void(^)(id json))success
              failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//    [ZLZUserDefaultUtil storeZXSToken:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjIyMCwiZXhwIjoxNTQwMTA2ODk2LCJwbGF0Zm9ybSI6IiJ9.dQKHXrBjOFG1gWnZhmxAvxotLv0O4NDc5mk7m1cyywY"];
    NSString *zxsToken = [ZLZUserDefaultUtil getZXSToken];
    if(zxsToken != nil){
        [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"Authorization"];
    }

//    [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"X-ECAPI-Authorization"];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        //10001 无效（没有token）。 ／／10002过期（token）
        if (model.code == 1000) {
            
            success(model.data);
        } else if(model.code == 10001||model.code == 10002){
            //10001 无效（没有token）／／10002过期（token）
//            [[NSNotificationCenter defaultCenter] postNotificationName:GO_BACK_TO_LOGIN_VC object:RC_TOKEN_INCORRET];
//            [NSUserDefaultUtil returnClearUserInfo];
            failure(model.code, model.message);
        }else{
     
                failure(model.code, model.message);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        } else if(error.code == -1009){
            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
            failure(error.code, @"网络异常，请稍后重试");
        } else {
            failure(error.code, @"系统内部错误");
        }
    }];
    
}

///////////////GET

//不用获取token
+(void)requestGETUnTokenPageWithUrl:(NSString*)url
                          params:(NSDictionary*)params
                         success:(void(^)(id json))success
                         failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    //////这个项目易社团的Java后台的 请求形式AFJSONRequestSerializer
    //.serialization.response Code=-1011 "Request failed: bad request (400)" UserInfo={NSLocalizedDescription=Request failed: bad request (400),
    //Content-Type application/json;charset=utf-8
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        if (model.code == 1000) {
            
            success(model.data);
        } else {
   
                failure(model.code, model.message);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        } else if(error.code == -1009){
            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
            failure(error.code, @"网络异常，请稍后重试");
        } else {
            failure(error.code, @"系统内部错误");
        }
    }];
}

//get待token访问
+(void)requestGETWithUrl:(NSString*)url
               params:(NSDictionary*)params
              success:(void(^)(id json))success
              failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //    [ZLZUserDefaultUtil storeZXSToken:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjIyMCwiZXhwIjoxNTQwMTA2ODk2LCJwbGF0Zm9ybSI6IiJ9.dQKHXrBjOFG1gWnZhmxAvxotLv0O4NDc5mk7m1cyywY"];
    NSString *zxsToken = [ZLZUserDefaultUtil getZXSToken];
    if(zxsToken != nil){
        [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"Authorization"];
    }
    
//    [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"X-ECAPI-Authorization"];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        //10001 无效（没有token）。 ／／10002过期（token）
        if (model.code == 1000) {
            
            success(model.data);
        } else if(model.code == 10001||model.code == 10002){
            //10001 无效（没有token）／／10002过期（token）
//            [[NSNotificationCenter defaultCenter] postNotificationName:GO_BACK_TO_LOGIN_VC object:RC_TOKEN_INCORRET];
            //            [NSUserDefaultUtil returnClearUserInfo];
            failure(model.code, model.message);
        }else{
            
                failure(model.code, model.message);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error.code == -1003) {
//            //ipv6数据连不上需要ipv4url
//            failure(error.code, @"网络异常，请稍后重试");
//        }
//        if(error.code == -1009){
//            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
//            failure(error.code, @"网络异常，请稍后重试");
//        }
//        failure(error.code, @"系统内部错误");
        NSLog(@"三方登录====####=*****===%@",error);
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        } else if(error.code == -1009){
            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
            failure(error.code, @"网络异常，请稍后重试");
        } else {
            failure(error.code, @"系统内部错误");
        }
    }];
    
}


//put待token访问
+(void)requestPUTWithUrl:(NSString*)url
                  params:(NSDictionary*)params
                 success:(void(^)(id json))success
                 failure:(void(^)(NSInteger code,NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //    [ZLZUserDefaultUtil storeZXSToken:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjIyMCwiZXhwIjoxNTQwMTA2ODk2LCJwbGF0Zm9ybSI6IiJ9.dQKHXrBjOFG1gWnZhmxAvxotLv0O4NDc5mk7m1cyywY"];
    NSString *zxsToken = [ZLZUserDefaultUtil getZXSToken];
    if(zxsToken != nil){
        [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"Authorization"];
    }
    
//    [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"X-ECAPI-Authorization"];
    [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        //10001 无效（没有token）。 ／／10002过期（token）
        if (model.code == 1000) {
            
            success(model.data);
        } else if(model.code == 10001||model.code == 10002){
            //10001 无效（没有token）／／10002过期（token）
//            [[NSNotificationCenter defaultCenter] postNotificationName:GO_BACK_TO_LOGIN_VC object:RC_TOKEN_INCORRET];
            //            [NSUserDefaultUtil returnClearUserInfo];
            failure(model.code, model.message);
        }else{
     
                failure(model.code, model.message);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        } else if(error.code == -1009){
            [[NSNotificationCenter defaultCenter] postNotificationName:NET_Failure_net object:@"网络连接失败"];
            failure(error.code, @"网络异常，请稍后重试");
        } else {
            failure(error.code, @"系统内部错误");
        }
    }];
}

//////////////

//不用获取token上传文件
+(void)uploadUnTokenWithUrl:(NSString *)url
                     params:(NSDictionary *)params
                      files:(NSArray<NSData*>*)files
                   fileName:(NSString *)fileName
                   progress:(void(^)(NSInteger progress))progress
                    success:(void (^)(id json))success
                    failure:(void (^)(NSInteger code, NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传的数据 name：部分是服务器用来解析的字段， 而fileName则是直接上传上去的图片， 注意一定要加 .jpg或者.png，（这个根据你得到这个imgData是通过jepg还是png的方式来获取决定）。 然后mimeType值也要与上面的类型对应， 网上看到有的说直接写成 @"image/*"， 据说也是可以的， 没验证过。
            for(int i=0;i<files.count;i++){
                [formData appendPartWithFileData:files[i]
                                            name:@"file"
                                        fileName:fileName
                                        mimeType:@"image/jpeg"]; //image/jpeg //form-urlencoded
            }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        if (model.code == 1000) {
            
            success(model.data);
        } else {
       
                failure(model.code, model.message);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        }else{
            failure(error.code, @"系统内部错误");
        }
    }];
    
}
//正文上传文件使用token
+(void)uploadWithUrl:(NSString *)url
              params:(NSDictionary *)params
               files:(NSArray<NSData*>*)files
            progress:(void(^)(NSInteger progress))progress
             success:(void (^)(id json))success
             failure:(void (^)(NSInteger code, NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/x-www-form-urlencoded", nil];
    
    //    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    
    NSString *zxsToken = [ZLZUserDefaultUtil getZXSToken];
    if(zxsToken != nil){
        [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"Authorization"];
    }
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传的数据
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        for(int i=0;i<files.count;i++){
            [formData appendPartWithFileData:files[i]
                                        name:@"file"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"]; //image/jpeg //form-urlencoded
            
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        //10001 无效（没有token）。 ／／10002过期（token）
        if (model.code == 1000) {
            
            success(model.data);
        } else if(model.code == 10001||model.code == 10002){
            //10001 无效（没有token）／／10002过期（token）
//            [[NSNotificationCenter defaultCenter] postNotificationName:GO_BACK_TO_LOGIN_VC object:RC_TOKEN_INCORRET];
            //清理用户
            failure(model.code, model.message);
        }else{
      
                failure(model.code, model.message);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        }else{
            failure(error.code, @"系统内部错误");
        }
    }];
    
}

//正文上传文件使用token
+(void)uploadToServiceWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                    fileName1:(NSString*)fileName1
                    fileName2:(NSString*)fileName2
                       files1:(NSArray<NSData*>*)files1
                       files2:(NSArray<NSData*>*)files2
                     progress:(void(^)(NSInteger progress))progress
                      success:(void (^)(id json))success
                      failure:(void (^)(NSInteger code, NSString *desc))failure{
    NSURL* baseURL = [NSURL URLWithString:SERVICE_HOST];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/x-www-form-urlencoded", nil];
    
    
    NSString *zxsToken = [ZLZUserDefaultUtil getZXSToken];
    if(zxsToken != nil){
        [manager.requestSerializer setValue:zxsToken forHTTPHeaderField:@"Authorization"];
    }
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传的数据
        if (files1.count>0) {
            for(int i=0;i<files1.count;i++){
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                formatter.dateFormat =@"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
                
                [formData appendPartWithFileData:files1[i]
                                            name:fileName1
                                        fileName:fileName
                                        mimeType:@"image/jpeg"]; //image/jpeg //form-urlencoded
            }
        }
        if (files2.count>0) {
            for(int i=0;i<files2.count;i++){
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                formatter.dateFormat =@"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
                
                [formData appendPartWithFileData:files2[i]
                                            name:fileName2
                                        fileName:fileName
                                        mimeType:@"image/jpeg"]; //image/jpeg //form-urlencoded
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonstring = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        BaseJsonModel *model = [BaseJsonModel mj_objectWithKeyValues:jsonstring];
        
        //        NSLog(@"model ____ %@",model);
        if (model.code == 1000) {
            
            success(model.data);
        } else {
        
                failure(model.code, model.message);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -1003) {
            //ipv6数据连不上需要ipv4url
            failure(error.code, @"网络异常，请稍后重试");
        }else{
            failure(error.code, @"系统内部错误");
        }
    }];
    
}

@end

