//
//  AppDelegate.m
//  PeopleDaily
//
//  Created by YLRS on 5/10/14.
//  Copyright (c) 2014 YLRS. All rights reserved.
//

#import "AppDelegate.h"
#import "ListenNewsViewController.h"

#import "NewsViewController.h"
#import "BaseViewController.h"
#import "AskViewController.h"
#import "PictureViewController.h"
#import "AssembleViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    ListenNewsViewController *listenView = [[ListenNewsViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listenView];
//    self.window.rootViewController = nav;
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:0] forKey:@"ListViewButton"];
    
    
    NewsViewController *news = [[NewsViewController alloc] init];
    BaseViewController *baseIndex = [[BaseViewController alloc] initWithRootViewController:news];
    
    AskViewController *ask = [[AskViewController alloc] init];
    BaseViewController *baseAsk = [[BaseViewController alloc] initWithRootViewController:ask];
    
    PictureViewController *picture = [[PictureViewController alloc] init];
    BaseViewController *basePicture = [[BaseViewController alloc] initWithRootViewController:picture];
    
    AssembleViewController *assemble = [[AssembleViewController alloc] init];
    BaseViewController *baseAssemble = [[BaseViewController alloc] initWithRootViewController:assemble];
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.tabBar.hidden = YES;
    _tabBarController.viewControllers = [NSArray arrayWithObjects:baseIndex,baseAsk,basePicture,baseAssemble, nil];
    
    
    self.window.rootViewController = _tabBarController;

    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}

- (void)selectTabBarController:(NSInteger)index{
    _tabBarController.selectedIndex = index;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
