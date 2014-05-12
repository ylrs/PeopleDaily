//
//  NetManager.h
//  PeopleDaily
//
//  Created by hapame on 14-5-12.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"

@interface NetManager : NSObject{
    AFJSONRequestOperation *_afJSONRequestoperation;
}


@property(nonatomic, strong)UIViewController *displayViewController;

//单例实例化
+ (NetManager *)sharedInstance;

/**
 * @param delegate 当前活动界面
 */
- (void)displayViewController:(UIViewController *)delegate;

#pragma mark - 

- (void)requestData:(NSMutableDictionary *)dic param:(NSString *)param;

@end
