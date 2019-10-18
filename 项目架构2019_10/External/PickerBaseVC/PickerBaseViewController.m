//
//  PickerBaseViewController.m
//  ZhenlvAPP
//
//  Created by guangjun wang on 2017/11/7.
//  Copyright © 2017年 zlz. All rights reserved.
//

#import "PickerBaseViewController.h"

@interface PickerBaseViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) UIView *selectView;
@property (strong, nonatomic) UIButton *cancleBtn;
@property (strong, nonatomic) UIButton *ensureBtn;
@property (strong, nonatomic) UILabel *pickerTitleLabel;
@end

@implementation PickerBaseViewController

- (instancetype)init{
    if (self = [super init]) {
        
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self initUI];
}

-(void)initUI{
    
    UIColor *color = [UIColor whiteColor];
    
    self.selectView = [[UIView alloc] init];
    _selectView.backgroundColor = color;
    [self.view addSubview:_selectView];
    
    self.cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancleBtn setTitle:@"取消" forState:0];
    [_cancleBtn setTitleColor:RGB(144, 144, 146) forState:UIControlStateNormal];
    _cancleBtn.frame = CGRectMake(0, 0, 60, 40);
    [_cancleBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_cancleBtn addTarget:self action:@selector(cancleAction) forControlEvents:UIControlEventTouchUpInside];
    [_selectView addSubview:_cancleBtn];
    
    self.ensureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_ensureBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_ensureBtn setTitleColor:RGB(144, 144, 146) forState:UIControlStateNormal];
    [_ensureBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_ensureBtn addTarget:self action:@selector(ensureAction) forControlEvents:UIControlEventTouchUpInside];
    [_selectView addSubview:_ensureBtn];
    
    self.pickerTitleLabel = [[UILabel alloc] init];
    _pickerTitleLabel.text = @"";
    [_pickerTitleLabel setFont:[UIFont systemFontOfSize:15]];
    _pickerTitleLabel.textColor = RGB(144, 144, 146);
    _pickerTitleLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_pickerTitleLabel];
    
    self.pickView = [[UIPickerView alloc] init];
    _pickView.delegate   = self;
    _pickView.dataSource = self;
    _pickView.backgroundColor = RGB(144, 144, 146);
    [self.view addSubview:_pickView];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat selectViewInsert = 5;
    CGFloat selectViewH = 40;
    CGFloat pickerViewH = 180;
    CGFloat btnW = 60;
    CGFloat btnH = 30;
    
    self.selectView.frame = CGRectMake(0, height - pickerViewH - selectViewH, width, selectViewH);
    self.cancleBtn.frame = CGRectMake(0, selectViewInsert, btnW, btnH);
    self.ensureBtn.frame = CGRectMake(width - btnW, selectViewInsert, btnW, btnH);
    self.pickView.frame = CGRectMake(0, CGRectGetMaxY(self.selectView.frame) , width,  pickerViewH);
    self.pickerTitleLabel.frame = CGRectMake(btnW, selectViewInsert, width - btnW * 2, btnH);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.1 animations:^{
        self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    } completion:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
}

#pragma mark - UIPickerViewDelegate & UIPickerViewDataSource
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:18]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return _dataArray.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _dataArray[component].count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _dataArray[component][row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return [UIScreen mainScreen].bounds.size.width / _dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 35;
}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return nil;
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

#pragma mark - privateMethods
/** 点击空白收回 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.y < CGRectGetMinY(self.selectView.frame)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/** 取消 */
-(void)cancleAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 确认 */
-(void)ensureAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter & setter
-(void)setPickerTitle:(NSString *)pickerTitle{
    _pickerTitle = pickerTitle;
    self.pickerTitleLabel.text = _pickerTitle;
}

-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self.pickView reloadAllComponents];
}

@end
