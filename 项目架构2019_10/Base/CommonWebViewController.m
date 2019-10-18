//
//  CommonWebViewController.m
//  EasyClub
//
//  Created by zhao on 2019/6/28.
//  Copyright © 2019 zhang. All rights reserved.
//

#import "CommonWebViewController.h"
#import "LoginLeftBtn.h"

@interface CommonWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) LoginLeftBtn *leftBtn;

@property(strong,nonatomic) UIWebView *webView;

@property(strong,nonatomic) UIBarButtonItem *leftButtonItem;

@property(nonatomic,strong) NSString *cur_str;
@property(nonatomic,strong) MBProgressHUD *showHud;
@property(nonatomic,assign) dispatch_once_t onceToken, onceToken2;

@end

@implementation CommonWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [UIWebView new];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
//        make.center.mas_equalTo(self.view);
    }];
    //    NSCharacterSet *whitespace = [NSCharacterSet  whitespaceAndNewlineCharacterSet];
    self.cur_str = [self.cur_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.cur_str = [self.cur_str stringByReplacingOccurrencesOfString:@"\r\n" withString:@""]; //换行符是\r\n 而不是\n
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.cur_str]];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_webView loadRequest:request];
    self.webView.backgroundColor = [UIColor clearColor];
    [self.webView setOpaque:NO];

    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //左侧建
    [self setBackLeftBtn];
    dispatch_once(&_onceToken, ^{
        self.showHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.leftBtn removeFromSuperview];
}

#pragma mark --画导航栏--
-(void)drawNavi{
    if (self.titStr.length>0) {
        self.navigationItem.title = self.titStr;
    } else {
        self.navigationItem.title = @"更改密码";
    }
}
-(void)backAction:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setLoadUrl:(NSString *)loadUrl{
    self.cur_str = loadUrl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    self.navigationItem.title = @"加载中……";
//    if (self.showHud) {
//        [self.showHud hideAnimated:YES];
//    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    _webView.scalesPageToFit = YES;
    
    //    [self.showHud hideAnimated:YES];
    dispatch_once(&_onceToken2, ^{
        [self.showHud hideAnimated:YES];
    });
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    self.navigationItem.title = @"加载异常";
//    [self.showHud hideAnimated:YES];
    dispatch_once(&_onceToken2, ^{
        [self.showHud hideAnimated:YES];
    });
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
   
    dispatch_once(&_onceToken, ^{
        self.showHud = [MBProgressHUD showText:@"" showImagesToView:self.view];
    });
    return YES;
}


-(void)setBackLeftBtn{
    
    LoginLeftBtn *leftBtn = [[LoginLeftBtn alloc]init];
    leftBtn.backgroundColor = [UIColor whiteColor];
    [leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [self.navigationController.navigationBar addSubview:leftBtn];
    
    //    [leftBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(0);
    //        make.size.mas_equalTo(CGSizeMake(75, 30));
    //        make.centerY.mas_equalTo(self.navigationItem.titleView.centerY);
    //    }];
    self.leftBtn = leftBtn;
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
