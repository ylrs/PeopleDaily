//
//  DefineModel.h
//  PeopleDaily
//
//  Created by hapame on 14-5-12.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#ifndef PeopleDaily_DefineModel_h
#define PeopleDaily_DefineModel_h
#endif


//ipad屏幕高度与宽度
#define MAINSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.height
#define MAINSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.width

#define HOMEMAKING_HTTP_METHOD_POST @"POST"
#define HOMEMAKING_HTTP_METHOD_GET @"GET"

#define HOMEMAKING_DOMAIN @"http://api.duoting.fm"
#define HOMEMAKING_DOMAIN_STATIC @"/v1"


//屏幕高度
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_HEIGHT (iPhone5 ? 568 : 480)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define STATUSBAR_HEIGHT ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 : 0)
