//
//  SelectGenderPickerViewController.m
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/11/7.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "SelectGenderPickerViewController.h"

@interface SelectGenderPickerViewController ()
//数据源数组
@property(nonatomic,strong) NSArray *genderArray;
@property(nonatomic,copy) NSString *currentGender;
@end

@implementation SelectGenderPickerViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.pickerTitle = @"请选择性别";
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    self.genderArray = @[@[@"男",@"女",@"保密"]];
    self.currentGender = _genderArray[0][0];
    self.dataArray = _genderArray;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentGender = self.genderArray[0][row];
}

#pragma mark - privateMethods

-(void)cancleAction{
    [super cancleAction];
}
-(void)ensureAction{
    [super ensureAction];
    
    if ([self.delegate respondsToSelector:@selector(genderPicker:selectedGernder:)]) {
        [self.delegate genderPicker:self selectedGernder:_currentGender];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
