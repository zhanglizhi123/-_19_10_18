//
//  Constant.h
//  MiDouShu
//
//  Created by mac on 2018/11/13.
//  Copyright © 2018年 zlz. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height

// 界面宽高
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

//颜色

#define RGB(r,g,b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

//尺寸
#define adp(obj) (obj)*SCREEN_WIDTH / 375.f

// 计算UI尺寸到屏幕尺寸
#define UIPxRatio 3.f
#define CalculateUIPxToScreenPixel(x) (float)((((float)x) / UIPxRatio) < 0.5f ? 0.5f : (((float)x) / UIPxRatio))

// 计算UI字体尺寸到屏幕尺寸
#define FontRatio 2.8f
#define CalculateUIFontSizeToScreenFontSize(x) (float)(((float)x) / FontRatio)
#define FontSizeForScreen(x)\
({\
float z = CalculateUIFontSizeToScreenFontSize(x);\
if ([SDiOSVersion deviceSize] == Screen4Dot7inch || [SDiOSVersion deviceSize] == Screen5Dot5inch || [SDiOSVersion deviceSize] == Screen5Dot8inch)\
{\
z;\
}\
else if ([SDiOSVersion deviceSize] == Screen3Dot5inch || [SDiOSVersion deviceSize] == Screen4inch)\
{\
z -= 2;\
}\
z;\
})

#define CreateSystemFontWithSize(x) [UIFont systemFontOfSize:FontSizeForScreen((x))]
#define CreateBoldSystemFontWithSize(x) [UIFont boldSystemFontOfSize:FontSizeForScreen((x))]

// 计算文本纵向间距
#define CalculateTextVerticalMarginHeight(x) \
({\
float z = 0;\
if ([SDiOSVersion deviceSize] == Screen4Dot7inch || [SDiOSVersion deviceSize] == Screen5Dot5inch || [SDiOSVersion deviceSize] == Screen5Dot8inch)\
{\
z = x * (2.f/3.f) / UIPxRatio;\
}\
else if ([SDiOSVersion deviceSize] == Screen3Dot5inch || [SDiOSVersion deviceSize] == Screen4inch)\
{\
z = x * (8.f/15.f) / UIPxRatio;\
}\
else\
{\
z = x;\
}\
z;\
})
//商品列表竖直高度
#define Vertical_Cell_Height 300
//商品列表水平高度
#define Horizontal_Cell_Height 220
//商品列表竖直宽度
#define Vertical_Cell_Weight (kFullScreenWidth-16)/2

#define kSearchTitleViewWidth adp(240)//搜索控件宽度
#define kSearchTitleViewHeight adp(30)//搜索控件高度


//view，圆角，宽度，颜色
#define klayerViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
 拼接字符串
 */
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

/**
 * Ready to use log macros with no context or tag.
 **/
#define DDLogDebug(frmt, ...)   LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

/**
 获取window
 */
#define k_window [[UIApplication sharedApplication].delegate window]
#define kApplicationDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])


//currentDevice 设备标识id 当卸载APP时候 会变
#define MyCurrentDevice [[UIDevice currentDevice] identifierForVendor].UUIDString


#define Device_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

/* weakSelf strongSelf reference */
#define WEAK_SELF(weakSelf) __weak __typeof(&*self) weakSelf = self;
#define STRONG_SELF(strongSelf) __strong __typeof(&*weakSelf) strongSelf = weakSelf;

#endif /* Constant_h */
