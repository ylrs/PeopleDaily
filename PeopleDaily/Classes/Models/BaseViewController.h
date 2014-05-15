//
//  BaseViewController.h
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHTabBar.h"
#import "ListView.h"

@interface BaseViewController : UINavigationController<ZHTabBarDelegate,ListViewDelegate>{
    NSMutableArray *_listArray;
    ListView *_listView;//左侧list
    UIButton *_shadeButton;//遮罩
}

@end
