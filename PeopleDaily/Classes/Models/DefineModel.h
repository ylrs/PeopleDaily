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


#define HOMEMAKING_HTTP_METHOD_POST @"POST"
#define HOMEMAKING_HTTP_METHOD_GET @"GET"

#define HOMEMAKING_DOMAIN @"http://192.168.17.204:8026"
#define HOMEMAKING_DOMAIN_STATIC @"/ticket"


//屏幕高度
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_HEIGHT (iPhone5 ? 568 : 480)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define STATUSBAR_HEIGHT ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 : 0)
