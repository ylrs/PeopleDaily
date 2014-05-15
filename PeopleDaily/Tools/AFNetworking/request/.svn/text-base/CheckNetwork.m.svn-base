//
//  CheckNetwork.m
//  CoolPai
//
//  Created by Heqin on 11-12-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CheckNetwork.h"
#import "Reachability.h"


@implementation CheckNetwork
#import <SystemConfiguration/SystemConfiguration.h>
#include <netdb.h>

//此处发现了判断网络状况的bug 用苹果自己官方的api可能会造成程序假死 直到崩溃 因此换方法检测网络状况
+(BOOL)isExistenceNetwork{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

/*
+(BOOL)isExistenceNetwork
{
	BOOL isExistenceNetwork;
	
    Reachability *r=[Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
			isExistenceNetwork=FALSE;
               NSLog(@"无网络连接");
            break;
        case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
               NSLog(@"通过3Ｇ上网");
            break;
        case ReachableViaWiFi:
			isExistenceNetwork=TRUE;
              NSLog(@"通过Wifi上网");        
            break;
    }
    
    return isExistenceNetwork;
}
*/
+(NSString *)netWorkStatus{
    Reachability *r = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    switch ([r currentReachabilityStatus]) {
        case NotReachable:

            return @"无网络";
            break;
        case ReachableViaWWAN:

            return @"移动3g";
            break;
        case ReachableViaWiFi:

            return @"wifi";
            break;
    }
    
    return @"无网络";
}


@end