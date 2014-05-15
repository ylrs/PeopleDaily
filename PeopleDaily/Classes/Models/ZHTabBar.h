//
//  ZHTabBar.h
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHTabBarDelegate;

@interface ZHTabBar : UIView

@property (nonatomic, assign) id<ZHTabBarDelegate>delegate;

@end


@protocol ZHTabBarDelegate <NSObject>

- (void)zhTabbar:(ZHTabBar *)tabBar didPressedButton:(UIButton *)button index:(NSInteger)index;

@end
