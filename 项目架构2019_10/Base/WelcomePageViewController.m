//
//  WelcomePageViewController.m
//  MiDouShu
//
//  Created by mac on 2018/11/13.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "WelcomePageViewController.h"
#import "MainTabBarViewController.h"
#import "SDCycleScrollView.h"

@interface WelcomePageViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong) SDCycleScrollView *imgvScrollView;

//@property(nonatomic,strong) UIButton *jumpBtn ;

@end

@implementation WelcomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:self.jumpBtn];
//    self.jumpBtn.titleLabel.font = TEXT_MIDD_S_FONT15;
//    [self.jumpBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [self.jumpBtn setTitle:@"欢迎页面---跳过" forState:UIControlStateNormal];
//    [self.jumpBtn addTarget:self action:@selector(clickedJumpBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view.mas_top).mas_offset(100);
//        make.left.mas_equalTo(self.view.mas_left).mas_offset(30);
//        make.right.mas_equalTo(self.view.mas_right).mas_offset(-30);
//        make.height.mas_equalTo(40);
//    }];
    [self drawNavi];
    [self drawMainView];
}
#pragma mark --画导航栏--
-(void)drawNavi{
    
}

-(void)drawMainView{
    self.imgvScrollView = [[SDCycleScrollView alloc]init];
    [self.view addSubview:self.imgvScrollView];
    self.imgvScrollView.delegate = self;
    self.imgvScrollView.autoScroll = NO;
    self.imgvScrollView.showPageControl = NO;
    self.imgvScrollView.infiniteLoop = NO;
    self.imgvScrollView.autoScrollTimeInterval = 2;
    self.imgvScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
//    self.imgvScrollView.placeholderImage =[UIImage imageNamed:@"ydy_1"];
    self.imgvScrollView.backgroundColor = [UIColor whiteColor];
    [self.imgvScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    NSMutableArray *arr_tp = [NSMutableArray array];
    for (int i = 1 ; i<=3; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"ydy_%d",i]];
        [arr_tp addObject:img];
    }
    self.imgvScrollView.localizationImageNamesGroup = arr_tp;
    
    
}


/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
    if (index == 2) {
        MainTabBarViewController  *vc = [[MainTabBarViewController alloc]init];
        [[UIApplication sharedApplication].delegate window].rootViewController = vc;
        [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
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

#pragma mark -- 点击跳过 --
-(void)clickedJumpBtn:(UIButton *)sender{
    NSLog(@"%@",@"跳过");
    MainTabBarViewController  *vc = [[MainTabBarViewController alloc]init];
    [[UIApplication sharedApplication].delegate window].rootViewController = vc;
    [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
}


@end
