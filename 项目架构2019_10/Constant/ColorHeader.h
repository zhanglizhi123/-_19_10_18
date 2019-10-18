//
//  ColorHeader.h
//  EasyClub
//
//  Created by zhao on 2019/4/17.
//  Copyright © 2019 zhang. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h


#define k_white_color [UIColor colorWithHexString:@"#ffffff" alpha:1.0]/*白色*/
#define k_black_color [UIColor colorWithHexString:@"#000000" alpha:1.0]/*黑色*/
//标题题目
#define k_main_color [UIColor colorWithHexString:@"#4a4a4a" alpha:1.0]/*主色_导航栏标题*/
//标题
#define k_title_color [UIColor colorWithHexString:@"#4a4a4a" alpha:1.0]//标题颜色
#define k_abstract_color [UIColor colorWithHexString:@"#666666" alpha:1.0]//摘要颜色黑
#define k_mainGray_color [UIColor colorWithHexString:@"#999999" alpha:1.0]//主灰色调
#define k_lightGray_color [UIColor colorWithHexString:@"#B3B3B3" alpha:1.0]//灰色调


//底部tabbar选中色调
#define k_main_bar_color [UIColor colorWithHexString:@"#ff4400" alpha:1.0]/*主题色 红*/
#define k_page_bkg_color [UIColor colorWithHexString:@"#f7f7f7" alpha:1.0]//页面背景灰色调
#define k_line_bkg_color [UIColor colorWithHexString:@"#F1F1F1" alpha:1.0]//线背景灰色调
#define k_line_bkg_e6_color [UIColor colorWithHexString:@"#E6E6E6" alpha:1.0]//线背景灰色调


#define k_blue_bkg_color RGB(86, 170, 252)//蓝色


//文字字体大小
#define k_mid_navi_title [UIFont boldSystemFontOfSize:16]
#define k_mid_navi_left [UIFont systemFontOfSize:12]


#define TEXT_HEX_BKG_238 RGB(238, 238, 238)

/**
 字体大小(常规/粗体/自定义)
 */
#define k_text_font(obj) [UIFont systemFontOfSize:adp(obj)]
#define k_bold_font(obj) [UIFont boldSystemFontOfSize:adp(obj)]
#define k_custom_font(name,obj) [UIFont fontWithName:(name) size:(adp(obj))]
/**
 弱引用
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define STRONG_SELF(strongSelf) __strong __typeof(&*weakSelf) strongSelf = weakSelf;


//字体型号
#define TEXT_BIG_S_FONT20 [UIFont systemFontOfSize:adp(20)]
#define TEXT_BIG_B_FONT20 [UIFont boldSystemFontOfSize:adp(20)]
#define TEXT_BIG_S_FONT19 [UIFont systemFontOfSize:adp(19)]
#define TEXT_BIG_B_FONT19 [UIFont boldSystemFontOfSize:adp(19)]
#define TEXT_BIG_S_FONT18 [UIFont systemFontOfSize:adp(18)]
#define TEXT_BIG_B_FONT18 [UIFont boldSystemFontOfSize:adp(18)]

#define TEXT_MIDD_S_FONT17 [UIFont systemFontOfSize:adp(17)]
#define TEXT_MIDD_B_FONT17 [UIFont boldSystemFontOfSize:adp(17)]
#define TEXT_MIDD_S_FONT16 [UIFont systemFontOfSize:adp(16)]
#define TEXT_MIDD_B_FONT16 [UIFont boldSystemFontOfSize:adp(16)]
#define TEXT_MIDD_S_FONT15 [UIFont systemFontOfSize:adp(15)]
#define TEXT_MIDD_B_FONT15 [UIFont boldSystemFontOfSize:adp(15)]
#define TEXT_MIDD_S_FONT14 [UIFont systemFontOfSize:adp(14)]
#define TEXT_MIDD_B_FONT14 [UIFont boldSystemFontOfSize:adp(14)]

#define TEXT_LIT_S_FONT13 [UIFont systemFontOfSize:adp(13)]
#define TEXT_LIT_B_FONT13 [UIFont boldSystemFontOfSize:adp(13)]
#define TEXT_LIT_S_FONT12 [UIFont systemFontOfSize:adp(12)]
#define TEXT_LIT_B_FONT12 [UIFont boldSystemFontOfSize:adp(12)]
#define TEXT_LIT_S_FONT11 [UIFont systemFontOfSize:adp(11)]
#define TEXT_LIT_B_FONT11 [UIFont boldSystemFontOfSize:adp(11)]
#define TEXT_LIT_S_FONT10 [UIFont systemFontOfSize:adp(10)]
#define TEXT_LIT_B_FONT10 [UIFont boldSystemFontOfSize:adp(10)]


/*
 * 随机颜色
 */
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif /* ColorHeader_h */
