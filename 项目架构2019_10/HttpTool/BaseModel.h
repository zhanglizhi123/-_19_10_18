//
//  BaseModel.h
//  EasyClub
//
//  Created by zhao on 2019/5/22.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseMessageModel;

@interface BaseModel : NSObject
@property(strong,nonatomic) id BusinessData;
@property(nonatomic,assign) NSInteger Timestamps;
@property(nonatomic,strong) BaseMessageModel *BusinessException;

@end

NS_ASSUME_NONNULL_END
