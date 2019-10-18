//
//  AppDelegate.m
//  项目架构2019_10
//
//  Created by mac on 2019/10/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomePageViewController.h"
#import "MainTabBarViewController.h"
//#import "LoginTelViewController.h"
#import "LoginViewController.h"

#pragma mark -- 友盟 --
// U-Share核心SDK
#import <UMShare/UMShare.h>
// U-Share分享面板SDK，未添加分享面板SDK可将此行去掉
#import <UShareUI/UShareUI.h>
#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogHeaders.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    
   
//    [self registerPushService];
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
//    [NSThread sleepForTimeInterval:0.8];   //设置进程停止2秒

//    [self setupMainViewController];
//    [[NTESRedPacketManager sharedManager] application:application didFinishLaunchingWithOptions:launchOptions];

    [self drawRootView];
    
    //开发者需要显式的调用此函数，日志系统才能工作
    //友盟
//    [UMCommonLogManager setUpUMCommonLogManager];
//    [UMConfigure setLogEnabled:YES];
//    [UMConfigure initWithAppkey:@"5d14285f4ca357d7fc001114" channel:@"App Store"];
//    [self configUSharePlatforms];
    
    [self dealHeader];
    // Custom code
    return YES;
}

- (void)confitUShareSettings{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}
- (void)configUSharePlatforms{
    
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxce9e6fa5f5e90de0" appSecret:@"d4f2a97c399436b221fe4b0dbf80d04f" redirectURL:@"http://mobile.umeng.com/social"];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"101685432"/*设置QQ平台的appID*/  appSecret:@"ba9ce0daa2f50998b7b4ae0949c05986" redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"310809517"  appSecret:@"491d371b386bad3d113ce0e6ad6cb4a4" redirectURL:@"https://api.weibo.com/oauth2/default.html"];
//    /* 支付宝的appKey */
//    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession appKey:@"2015111700822536" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
}



// 支持所有iOS系统
#pragma mark - openURL
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
//        [[NTESRedPacketManager sharedManager] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        return YES;
    }
    return result;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    if (!result) {
//        [[NTESRedPacketManager sharedManager] application:app openURL:url options:options];
        return YES;
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        //目前只有红包跳转
//        return [[NTESRedPacketManager sharedManager] application:application handleOpenURL:url];
    }
    return result;
}


-(void)drawRootView{
       

  if ([[[NSUserDefaults standardUserDefaults]objectForKey:Yin_Dao_Ye] isEqualToString:@"OK"] ) {
          
  //        if ([ZLZUserDefaultUtil getZXSToken].length<1 || [ZLZUserDefaultUtil getZXSToken] == nil) {
  //            LoginTelViewController*xxVC = [[LoginTelViewController alloc]init];
  //            UINavigationController *xxNVC = [[UINavigationController alloc] initWithRootViewController:xxVC];
  //            self.window.rootViewController = xxNVC;
  //            [self.window makeKeyAndVisible];
  //        } else {
              MainTabBarViewController  *vc = [[MainTabBarViewController alloc]init];
              self.window.rootViewController = vc;
              [self.window makeKeyAndVisible];
  //        }
      } else {
          WelcomePageViewController  *vc = [[WelcomePageViewController alloc]init];
          [[NSUserDefaults standardUserDefaults]setObject:@"OK" forKey:Yin_Dao_Ye];
          self.window.rootViewController = vc;
          
          [self.window makeKeyAndVisible];
      }
}


#pragma mark - ApplicationDelegate
- (void)applicationDidBecomeActive:(UIApplication *)application{
//    [self userPreferencesConfig];
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
//       NSInteger count = [[[NIMSDK sharedSDK] conversationManager] allUnreadCount];
//       [[UIApplication sharedApplication] setApplicationIconBadgeNumber:count];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
//    [[NIMSDK sharedSDK] updateApnsToken:deviceToken];

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{

}



- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{

}

#pragma mark - misc
- (void)registerPushService
{
//    if (@available(iOS 11.0, *))
//    {
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
//            if (!granted)
//            {
//                dispatch_async_main_safe(^{
//                    [[UIApplication sharedApplication].keyWindow makeToast:@"请开启推送功能否则无法收到推送通知" duration:2.0 position:CSToastPositionCenter];
//                })
//            }
//        }];
//    }
//    else
//    {
//        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
//                                                                                 categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    
    // 注册push权限，用于显示本地推送
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
}




- (void)setupLoginViewController{
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
//    LoginTelViewController*xxVC = [[LoginTelViewController alloc]init];
    LoginViewController *xxVC = [[LoginViewController alloc]init];
    UINavigationController *xxNVC = [[UINavigationController alloc] initWithRootViewController:xxVC];
    self.window.rootViewController = xxNVC;
    [self.window makeKeyAndVisible];
}

#pragma mark - 注销
-(void)logout:(NSNotification *)note{
    [self doLogout];
}

- (void)doLogout{
//    [[NTESLoginManager sharedManager] setCurrentLoginData:nil];
//    [[NTESServiceManager sharedManager] destory];
//    [self setupLoginViewController];
}




-(void)dealHeader{
    SDWebImageDownloader *imgDownloader = SDWebImageManager.sharedManager.imageDownloader;
    imgDownloader.headersFilter  = ^NSDictionary *(NSURL *url, NSDictionary *headers) {
        NSFileManager *fm = [[NSFileManager alloc] init];
        NSString *imgKey = [SDWebImageManager.sharedManager cacheKeyForURL:url];
        NSString *imgPath = [SDWebImageManager.sharedManager.imageCache defaultCachePathForKey:imgKey];
        NSDictionary *fileAttr = [fm attributesOfItemAtPath:imgPath error:nil];
        
        NSMutableDictionary *mutableHeaders = [headers mutableCopy];
        
        NSDate *lastModifiedDate = nil;
        
        if (fileAttr.count > 0) {
            if (fileAttr.count > 0) {
                lastModifiedDate = (NSDate *)fileAttr[NSFileModificationDate];
            }
            
        }
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        formatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
        
        NSString *lastModifiedStr = [formatter stringFromDate:lastModifiedDate];
        lastModifiedStr = lastModifiedStr.length > 0 ? lastModifiedStr : @"";
        [mutableHeaders setValue:lastModifiedStr forKey:@"If-Modified-Since"];
        
        return mutableHeaders;
    };
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
