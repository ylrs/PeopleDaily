//
//  BaseViewController.m
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationBar.barTintColor = [UIColor redColor];
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    ZHTabBar *tabBar = [[ZHTabBar alloc] initWithFrame:CGRectMake(0, 768-44, 1024, 44)];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    
    _listView = [[ListView alloc] init];
    _listView.frame = CGRectMake(-88, 0, 88, 768);
    _listView.delegate = self;
    _listView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_listView];
    
    _shadeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shadeButton.frame = CGRectMake(-936, 0, 936, 768);
    _shadeButton.backgroundColor = [UIColor clearColor];
    [_shadeButton addTarget:self action:@selector(shadeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shadeButton];
    
    
//    _listArray = [[NSMutableArray alloc] init];
//    
//    [[NetManager sharedInstance] requestGetData:nil param:@"/v1/news/allclass" success:^(NSMutableArray *dataArray) {
//        _listArray = dataArray;
//    } failure:^(NSError *error) {
//        
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZHTabBarDelegate
- (void)zhTabbar:(ZHTabBar *)tabBar didPressedButton:(UIButton *)button index:(NSInteger)index{
    if (index == 1) {
        [self showListView];
    }
}

- (void)shadeButtonPressed{
    [self hideListView];
}

#pragma mark -ListView

- (void)listView:(ListView *)listView selectedButton:(NSInteger)index{
    [self hideListView];
}

- (void)showListView{
    [_listView checkButtons:[[[NSUserDefaults standardUserDefaults] objectForKey:@"ListViewButton"] intValue]];
    [UIView animateWithDuration:0.3 animations:^{
        [_listView setFrame:CGRectMake(0, 0, 88, 768)];
        [_shadeButton setFrame:CGRectMake(88, 0, 936, 768)];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideListView{
    [UIView animateWithDuration:0.3 animations:^{
        [_listView setFrame:CGRectMake(-88, 0, 88, 768)];
        [_shadeButton setFrame:CGRectMake(-936, 0, 936, 768)];
    } completion:^(BOOL finished) {
        
    }];
}

@end
