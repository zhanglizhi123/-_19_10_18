//
//  MyTextField.m
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/8/17.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.textClickBlock) {
        self.textClickBlock(0);
    }
}

@end
