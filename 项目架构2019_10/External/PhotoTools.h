//
//  PhotoTools.h
//  Loving
//
//  Created by CveniEs on 2019/1/3.
//  Copyright © 2019 CveniEs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoTools : NSObject

- (void)selectedPhotoAlbumOrTakePhotoWithController:(UIViewController *)viewController photoBlock:(void(^)(UIImage *image))photoBlock;

@end

NS_ASSUME_NONNULL_END
