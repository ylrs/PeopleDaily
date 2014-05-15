//
//  AppDelegate.h
//  PeopleDaily
//
//  Created by YLRS on 5/10/14.
//  Copyright (c) 2014 YLRS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>{
    UITabBarController *_tabBarController;
    
}

@property (strong, nonatomic) UIWindow *window;
- (void)selectTabBarController:(NSInteger)index;

@end
