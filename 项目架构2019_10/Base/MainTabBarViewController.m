//
//  MainTabBarViewController.m
//  MiDouShu
//
//  Created by mac on 2018/11/13.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationController.h"
//#import "HomeViewController.h"
#import "HomeNewViewController.h"
//#import "AssociationViewController.h"
//#import "MessageViewController.h"
//#import "MineViewController.h"
#import "AppDelegate.h"
//#import "LoginTelViewController.h"
//#import "LoginViewController.h"

@interface MainTabBarViewController ()<UITabBarControllerDelegate>

//@property (nonatomic,assign) NSInteger sessionUnreadCount;


@end

@implementation MainTabBarViewController
+ (instancetype)instance {
    AppDelegate *delegete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = delegete.window.rootViewController;
    if ([vc isKindOfClass:[MainTabBarViewController class]]) {
        return (MainTabBarViewController *)vc;
    }else{
        return nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [[UINavigationBar appearance] setTintColor: THEME_GRAY_COLOR];
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:k_mainGray_color,NSFontAttributeName:TEXT_LIT_B_FONT13} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:k_main_bar_color,NSFontAttributeName:TEXT_LIT_B_FONT13} forState:UIControlStateSelected];

    self.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor] ;
    self.tabBar.alpha = 1.0f;
    self.tabBar.tintColor = k_white_color ;
    //解决这个问题是 iOS 12.1 Beta 2 引入的问题，只要 UITabBar 是磨砂的，并且 push viewController 时 hidesBottomBarWhenPushed = YES 则手势返回的时候就会触发，出现这个现象的直接原因是 tabBar 内的按钮 UITabBarButton 被设置了错误的 frame，frame.size 变为 (0, 0) 导致的。
    [UITabBar appearance].translucent = NO;
    
//    [self getNotfSeverce];
    //首页    
    HomeNewViewController *homeVC = [[HomeNewViewController alloc]init];
    BaseNavigationController *homeNVC = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    homeNVC.tabBarItem = [self generateTabBarItem:@"首页" imgName:@"home_unselect" selectedImgName:@"home_select"];
    [self addChildViewController:homeNVC];
    
    HomeNewViewController *homeVC2 = [[HomeNewViewController alloc]init];
    BaseNavigationController *homeNVC2 = [[BaseNavigationController alloc] initWithRootViewController:homeVC2];
    homeNVC2.tabBarItem = [self generateTabBarItem:@"首页2" imgName:@"home_unselect" selectedImgName:@"home_select"];
    [self addChildViewController:homeNVC2];
    
//    //协会
//    AssociationViewController *xhVC = [[AssociationViewController alloc]init];
//    BaseNavigationController *xhNC = [[BaseNavigationController alloc] initWithRootViewController:xhVC];
//    xhNC.tabBarItem = [self generateTabBarItem:@"协会" imgName:@"xihui_unselect" selectedImgName:@"xihui_select"];
//    [self addChildViewController:xhNC];
//
//
//    //消息
//    MessageViewController*xxVC = [[MessageViewController alloc]init];
//    BaseNavigationController *xxNVC = [[BaseNavigationController alloc] initWithRootViewController:xxVC];
//    xxNVC.tabBarItem = [self generateTabBarItem:@"消息" imgName:@"xiaoxi_unselect" selectedImgName:@"xiaoxi_select"];
//    [self addChildViewController:xxNVC];
//
//
//    //我的
//    MineViewController *mineVC = [[MineViewController alloc]init];
//    BaseNavigationController *mineNVC = [[BaseNavigationController alloc] initWithRootViewController:mineVC];
//    mineNVC.tabBarItem = [self generateTabBarItem:@"我的" imgName:@"wode_unselect" selectedImgName:@"wode_select"];
//    [self addChildViewController:mineNVC];
    
}

//-(void)getNotfSeverce{
//    [[NIMSDK sharedSDK].systemNotificationManager addDelegate:self];
//    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
//
//}

-(UITabBarItem*)generateTabBarItem:(NSString*)title imgName:(NSString*)imgName selectedImgName:(NSString*)selectedImgName{
    
    UIImage *img = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImg = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:selectedImg];
}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (tabBarController.selectedIndex == 0) {
//        BaseNavigationController *homeNVC = tabBarController.viewControllers.firstObject;
//        [homeNVC popToRootViewControllerAnimated:YES];
//    }
//    if (tabBarController.selectedIndex>0) {
//        if ([ZLZUserDefaultUtil getZXSToken].length<1 || [ZLZUserDefaultUtil getZXSToken] == nil) {
//            [self setSelectedIndex:0];
//
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您未登录，不能使用该功能" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"去登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [self loginOutPage];
//            }];
//            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
////                [self setSelectedIndex:0];
//                BaseNavigationController *homeNVC = tabBarController.viewControllers.firstObject;
//                [homeNVC popToRootViewControllerAnimated:YES];
//            }];;
//            [alertController addAction:okAction];
//            [alertController addAction:cancelAction];
//            [viewController presentViewController:alertController animated:YES completion:nil];
//
//        }
//    }
//}

//#pragma mark - NIMConversationManagerDelegate
//- (void)didAddRecentSession:(NIMRecentSession *)recentSession
//           totalUnreadCount:(NSInteger)totalUnreadCount{
//
//    self.sessionUnreadCount = totalUnreadCount;
//    [self refreshSessionBadge];
//}
//
//
//- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
//              totalUnreadCount:(NSInteger)totalUnreadCount{
//
//    self.sessionUnreadCount = totalUnreadCount;
//    [self refreshSessionBadge];
//}
//
//
//- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession totalUnreadCount:(NSInteger)totalUnreadCount{
//    self.sessionUnreadCount = totalUnreadCount;
//    [self refreshSessionBadge];
//}
//
//- (void)messagesDeletedInSession:(NIMSession *)session{
//    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
//    [self refreshSessionBadge];
//}
//
//- (void)allMessagesDeleted{
//    self.sessionUnreadCount = 0;
//    [self refreshSessionBadge];
//}
//
//- (void)allMessagesRead
//{
//    self.sessionUnreadCount = 0;
//    [self refreshSessionBadge];
//}
//
//
//#pragma mark - Notification
//
//- (void)refreshSessionBadge{
////    UINavigationController *nav = self.viewControllers[NTESMainTabTypeMessageList];
////    nav.tabBarItem.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
//
//    if (self.viewControllers.count>=2) {
//        //消息
//        BaseNavigationController *xxNVC = self.viewControllers[2];
//        xxNVC.tabBarItem.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
//    }
//}
//
//-(void)loginOutPage{
////    LoginTelViewController*xxVC = [[LoginTelViewController alloc]init];
//    LoginViewController *xxVC = [[LoginViewController alloc]init];
//    UINavigationController *xxNVC = [[UINavigationController alloc] initWithRootViewController:xxVC];
//    [UIApplication sharedApplication].keyWindow.rootViewController = xxNVC;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
