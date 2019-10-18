//
//  GetLocation.m
//  Loving
//
//  Created by YJC on 2019/1/10.
//  Copyright © 2019年 CveniEs. All rights reserved.
//

#import "GetLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GetLocation ()<CLLocationManagerDelegate>


@end

@implementation GetLocation
{
    CLLocationManager *locationmanager;//定位服务
    NSString *currentCity;//当前城市
    NSString *strlatitude;//纬度
    NSString *strlongitude;//经度
}
static GetLocation *_sharedGetLocation = nil;


+(instancetype)shareGetLocation{
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken,^{
        _sharedGetLocation = [[self alloc] init];
    });
    return _sharedGetLocation;
}



-(void)getLocation{
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        locationmanager = [[CLLocationManager alloc]init];
        locationmanager.delegate = self;
        [locationmanager requestAlwaysAuthorization];
        currentCity = [NSString new];
        [locationmanager requestWhenInUseAuthorization];
        
        //设置寻址精度
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
        locationmanager.distanceFilter = 5.0;
        [locationmanager startUpdatingLocation];
    }
}

#pragma mark CoreLocation delegate (定位失败)
//定位失败后调用此代理方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //设置提示提醒用户打开定位服务
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"允许定位提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [[self getCurrentVC] presentViewController:alert animated:YES completion:nil];
}

#pragma mark 定位成功后则执行此代理方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [locationmanager stopUpdatingLocation];
    //旧址
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //打印当前的经度与纬度
    NSLog(@"%f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    strlatitude =[NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude];
    strlongitude = [NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude];
    
    __block typeof(locationmanager)locationmanager_self = locationmanager;
    //反地理编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            // 纬度
            CLLocationDegrees latitude = currentLocation.coordinate.latitude;
            // 经度
            CLLocationDegrees longitude = currentLocation.coordinate.longitude;

            CLPlacemark *place = [placemarks lastObject];
//             NSLog(@"City,%@",place.addressDictionary[@"City"]);
//             NSLog(@"Country,%@",place.addressDictionary[@"Country"]);
//             NSLog(@"CountryCode,%@",place.addressDictionary[@"CountryCode"]);
//             NSLog(@"FormattedAddressLines,%@",place.addressDictionary[@"FormattedAddressLines"]);
//             NSLog(@"Name,%@",place.addressDictionary[@"Name"]);
             NSLog(@"State,%@",place.addressDictionary[@"State"]);
//             NSLog(@"Street,%@",place.addressDictionary[@"Street"]);
//             NSLog(@"SubLocality,%@",place.addressDictionary[@"SubLocality"]);
//             NSLog(@"Thoroughfare,%@",place.addressDictionary[@"Thoroughfare"]);
            // 位置名
            NSLog(@"name,%@",place.name);
            // 街道
            NSLog(@"thoroughfare,%@",place.thoroughfare);
            // 子街道
            NSLog(@"subThoroughfare,%@",place.subThoroughfare);
            // 市
            NSLog(@"locality,%@",place.locality);
            // 区
            NSLog(@"subLocality,%@",place.subLocality);
            // 国家
            NSLog(@"country,%@",place.country);

            if (self.locationDataBlock) {
                self.locationDataBlock(place.addressDictionary[@"State"],place.locality, [NSString stringWithFormat:@"%f",latitude], [NSString stringWithFormat:@"%f",longitude]);
                [locationmanager_self stopUpdatingLocation];
            }
            if (placemarks.count>0) {
                [locationmanager_self stopUpdatingLocation];
            }
        }
        
    }];
}




//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}


 @end
