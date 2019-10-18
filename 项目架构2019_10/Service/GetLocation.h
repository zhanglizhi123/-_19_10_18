//
//  GetLocation.h
//  Loving
//
//  Created by YJC on 2019/1/10.
//  Copyright © 2019年 CveniEs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GetLocationDataBlock)(NSString * _Nullable stateCity, NSString * _Nullable currentCity,NSString * _Nullable strlatitude,NSString * _Nullable strlongitude);
NS_ASSUME_NONNULL_BEGIN

@interface GetLocation : NSObject

@property(nonatomic,copy)GetLocationDataBlock locationDataBlock;

+(instancetype)shareGetLocation;

-(void)getLocation;

@end

NS_ASSUME_NONNULL_END
