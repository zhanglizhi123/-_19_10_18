//
//  UIButton+Multiple.m
//  MiDouShu
//
//  Created by 高启 on 2018/11/22.
//  Copyright © 2018 zlz. All rights reserved.
//

#import "UIButton+Multiple.h"
#import <objc/runtime.h>
static NSString *btnTagNameKey = @"btnTagNameKey";
@implementation UIButton (Multiple)
-(void)setBtnTagName:(NSString *)btnTagName{
    objc_setAssociatedObject(self, &btnTagNameKey, btnTagName, OBJC_ASSOCIATION_COPY);
}

-(NSString *)btnTagName{
    return objc_getAssociatedObject(self, &btnTagNameKey);
}
@end
