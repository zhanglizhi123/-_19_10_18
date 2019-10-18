//
//  BaseJsonModel.h
//  EasyClub
//
//  Created by zhao on 2019/4/17.
//  Copyright © 2019 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseJsonModel : NSObject

@property(strong,nonatomic) id data;
@property(nonatomic,assign) NSInteger code;
@property(nonatomic,strong) id message;
@property(nonatomic,strong) NSString *msg;

@end

NS_ASSUME_NONNULL_END
