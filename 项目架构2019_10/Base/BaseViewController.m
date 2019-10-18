
//
//  BaseViewController.m
//  MiDouShu
//
//  Created by mac on 2018/11/13.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;/*自定义的手势*/
@property (nonatomic, strong) UIImage *backImg;
@property(nonatomic,strong) UILabel *infoL;

@end

@implementation BaseViewController

#pragma mark ---- Init

#pragma mark ---- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置基本属性
    self.view.backgroundColor = k_white_color;
    //    self.navigationController.navigationBar.tintColor = k_white_color;/*导航栏字体颜色*/
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = k_white_color;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:k_title_color,NSFontAttributeName:TEXT_MIDD_B_FONT16}];
    [self.navigationController.navigationBar setTintColor:k_title_color];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    
    self.navigationItem.hidesBackButton = YES;
    self.isHiddenBackItem = self.navigationController.viewControllers.count == 1;/*显示自定义返回按钮*/
    [self loadBaseBackButtonGes];/*添加自定义手势*/
    [self setIsPopEnable:NO];/*允许侧滑*/
    self.fd_interactivePopDisabled = YES;
    
    [self loadUI];
    
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginInUpdata) name:Login_In object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginOutPage) name:Login_Out object:nil];
    [self messageView];
}
-(void)messageView{
    self.infoL = [[UILabel alloc]init];
    [self.view addSubview:self.infoL];
//    self.infoL.center = self.view.center;
    self.infoL.hidden = YES;
    self.infoL.textColor = k_title_color;
    self.infoL.font = TEXT_MIDD_S_FONT15;
    [self.infoL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_centerY).mas_offset(-50);
    }];
}

#pragma mark ---- Event Response
/**
 返回
 */
- (void)baseViewControllerBackClick:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ---- Delegate

#pragma mark ---- DataRequest

#pragma mark ---- Private Methods
/**
 加载自定义侧滑手势
 */
- (void)loadBaseBackButtonGes {
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    self.panGesture.edges = UIRectEdgeLeft;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
/**
 是否允许侧滑返回 允许-NO 不允许-YES
 */
- (void)setIsPopEnable:(BOOL)isPopEnable {
    _isPopEnable = isPopEnable;
    if (isPopEnable) {
        [self.view removeGestureRecognizer:self.panGesture];
    }else{
        [self.view addGestureRecognizer:self.panGesture];
    }
}
/**
 是否隐藏自定义返回按钮 隐藏-YES 显示-NO
 */
- (void)setIsHiddenBackItem:(BOOL)isHiddenBackItem {
    _isHiddenBackItem = isHiddenBackItem;
    self.navigationItem.hidesBackButton = isHiddenBackItem;
    if (isHiddenBackItem) {
        self.navigationItem.leftBarButtonItem = nil;
    }else{
        self.backButtonItem = [[UIBarButtonItem alloc] initWithImage:self.backImg style:UIBarButtonItemStylePlain target:self action:@selector(baseViewControllerBackClick:)];
        self.navigationItem.leftBarButtonItem = self.backButtonItem;
    }
}
#pragma mark ---- UI
- (void)loadUI {}
-(void)loginInUpdata{}
-(void)loginOutPage{}
-(void)showPageInfo:(BOOL)isHiden message:(NSString *)message{
    self.infoL.hidden = isHiden;
    if (isHiden) {
        [self.view sendSubviewToBack:self.infoL];
    } else {
        [self.view bringSubviewToFront:self.infoL];
        self.infoL.text = message;
    }
}


#pragma mark ---- Getter and Setter
- (UIImage *)backImg {
    if (!_backImg) {
//        _backImg = [UIImage imageNamed:@"ze_back_icon"];
        _backImg = [_backImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _backImg;
}
#pragma mark ---- Ohter
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Login_Out object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Login_In object:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
@end
