//
//  ListView.h
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListViewDelegate;

@interface ListView : UIView{
    NSMutableArray *_listButtonArray;
    NSMutableArray *_listNameArray;
}

@property (nonatomic, assign) id<ListViewDelegate>delegate;


- (void)checkButtons:(int)index;

@end

@protocol ListViewDelegate <NSObject>

- (void)listView:(ListView *)listView selectedViewController:(NSInteger)index;
- (void)listView:(ListView *)listView selectedButton:(NSInteger)index;
@end