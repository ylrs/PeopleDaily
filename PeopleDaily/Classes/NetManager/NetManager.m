//
//  NetManager.m
//  PeopleDaily
//
//  Created by hapame on 14-5-12.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import "NetManager.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFImageRequestOperation.h"
#import "CheckNetwork.h"

@implementation NetManager


#pragma mark -
#pragma mark 单例

static NetManager *sharedInstance=nil;
+ (NetManager *) sharedInstance
{
    @synchronized(self)
    {
        if(!sharedInstance)
        {
            sharedInstance=[[self alloc] init];
        }
        return sharedInstance;
    }
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (void)displayViewController:(UIViewController *)delegate{
    self.displayViewController = delegate;
}

/* get方法 */
- (void)getData:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSURLRequest *operation, id responseObject))success
        failure:(void (^)(NSURLRequest *operation, NSError *error))failure{
    NSURL *url = [NSURL URLWithString:HOMEMAKING_DOMAIN];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:HOMEMAKING_HTTP_METHOD_GET path:[NSString stringWithFormat:@"%@%@",HOMEMAKING_DOMAIN_STATIC,path] parameters:parameters];
    [request setTimeoutInterval:15.];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    _afJSONRequestoperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"发出的请求 %@",request);
        success(request,JSON);
    } failure:^(NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON){
        if(![CheckNetwork isExistenceNetwork]){
            error=[NSError errorWithDomain:@"无连接" code:201 userInfo:nil];
        }else{
            error=[NSError errorWithDomain:@"服务器异常" code:202 userInfo:nil];
        }
        failure(request,error);
        
    }];
    
    [_afJSONRequestoperation start];
}

/*post方法*/
- (void)postData:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(NSURLRequest *operation, id responseObject))success
         failure:(void (^)(NSURLRequest *operation, NSError *error))failure
{
    
    NSURL *url = [NSURL URLWithString:HOMEMAKING_DOMAIN];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSURLRequest *request = [httpClient requestWithMethod:HOMEMAKING_HTTP_METHOD_POST path:[NSString stringWithFormat:@"%@%@",HOMEMAKING_DOMAIN_STATIC,path] parameters:parameters];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        success(request,JSON);
    } failure:^(NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON){
        
        
        NSLog(@"网络错误：%@",[error localizedDescription]);
        if(![CheckNetwork isExistenceNetwork]){
            error=[NSError errorWithDomain:@"无连接" code:201 userInfo:nil];
        }else{
            error=[NSError errorWithDomain:@"服务器异常" code:202 userInfo:nil];
        }
        failure(request,error);
    }];
    
    [operation start];
}


- (void)requestData:(NSMutableDictionary *)dic param:(NSString *)param{
    
    [self postData:[NSString stringWithFormat:@"%@",param] parameters:dic success:^(NSURLRequest *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLRequest *operation, NSError *error) {
        NSLog(@"\nerror %@",error);
        
    }];

}

@end
