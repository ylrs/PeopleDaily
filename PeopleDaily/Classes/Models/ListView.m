//
//  ListView.m
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import "ListView.h"
//#import "AppDelegate.h"

@implementation ListView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _listButtonArray = [[NSMutableArray alloc] init];
        _listNameArray = [[NSMutableArray alloc] init];
        
        
        //闻
        UIButton *newsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        newsButton.frame = CGRectMake(8, 40, 72, 72);
        newsButton.tag = 0;
        [newsButton setImage:[UIImage imageNamed:@"news"] forState:UIControlStateNormal];
        [newsButton setImage:[UIImage imageNamed:@"news_pressed"] forState:UIControlStateSelected];
        [newsButton addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:newsButton];
        
        UILabel *newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 112, 72, 20)];
        newsLabel.backgroundColor = [UIColor clearColor];
        newsLabel.tag = 0;
        newsLabel.text = @"闻";
        newsLabel.textColor = [UIColor redColor];
        newsLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:newsLabel];
        
        
        //问
        UIButton *askButton = [UIButton buttonWithType:UIButtonTypeCustom];
        askButton.frame = CGRectMake(8, 152, 72, 72);
        askButton.tag = 1;
        [askButton setImage:[UIImage imageNamed:@"ask"] forState:UIControlStateNormal];
        [askButton setImage:[UIImage imageNamed:@"ask_pressed"] forState:UIControlStateSelected];
        [askButton addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:askButton];
        
        UILabel *askLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 224, 72, 20)];
        askLabel.backgroundColor = [UIColor clearColor];
        askLabel.tag = 1;
        askLabel.text = @"问";
        askLabel.textColor = [UIColor grayColor];
        askLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:askLabel];
        
        
        //图
        UIButton *pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        pictureButton.frame = CGRectMake(8, 300, 72, 72);
        pictureButton.tag = 2;
        [pictureButton setImage:[UIImage imageNamed:@"picture"] forState:UIControlStateNormal];
        [pictureButton setImage:[UIImage imageNamed:@"picture_pressed"] forState:UIControlStateSelected];
        [pictureButton addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pictureButton];
        
        UILabel *pictureLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 374, 72, 20)];
        pictureLabel.backgroundColor = [UIColor clearColor];
        pictureLabel.tag = 2;
        pictureLabel.text = @"图";
        pictureLabel.textColor = [UIColor grayColor];
        pictureLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:pictureLabel];
        
        
        //聚
        UIButton *assembleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        assembleButton.frame = CGRectMake(8, 400, 72, 72);
        assembleButton.tag = 3;
        [assembleButton setImage:[UIImage imageNamed:@"assemble"] forState:UIControlStateNormal];
        [assembleButton setImage:[UIImage imageNamed:@"assemble_pressed"] forState:UIControlStateSelected];
        [assembleButton addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:assembleButton];
        
        UILabel *assembleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 474, 72, 20)];
        assembleLabel.backgroundColor = [UIColor clearColor];
        assembleLabel.tag = 3;
        assembleLabel.text = @"聚";
        assembleLabel.textColor = [UIColor grayColor];
        assembleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:assembleLabel];
        
        [_listButtonArray addObject:newsButton];
        [_listButtonArray addObject:askButton];
        [_listButtonArray addObject:pictureButton];
        [_listButtonArray addObject:assembleButton];
        
        [_listNameArray addObject:newsLabel];
        [_listNameArray addObject:askLabel];
        [_listNameArray addObject:pictureLabel];
        [_listNameArray addObject:assembleLabel];

    }
    return self;
}

- (void)listButtonPressed:(UIButton *)button{
    for (UIButton *allButton in _listButtonArray) {
        [allButton setSelected:NO];
        allButton.userInteractionEnabled = YES;
        
        if (button.tag == allButton.tag) {
            NSLog(@"点击了第%d个按钮",button.tag);
            [button setSelected:YES];
            button.userInteractionEnabled = NO;
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:button.tag] forKey:@"ListViewButton"];
        }
    }
    
    for (UILabel *lbl in _listNameArray) {
        lbl.textColor = [UIColor grayColor];
        
        if (button.tag == lbl.tag) {
            NSLog(@"点击了第%d个按钮的文字需要变红",lbl.tag);
            lbl.textColor = [UIColor redColor];
        }
    }
    
    [(AppDelegate *) [UIApplication sharedApplication].delegate selectTabBarController:(NSInteger)button.tag];
    
    if ([self.delegate respondsToSelector:@selector(listView:selectedViewController:)]) {
        [self.delegate listView:self selectedViewController:button.tag];
    }
    
    if ([self.delegate respondsToSelector:@selector(listView:selectedButton:)]) {
        [self.delegate listView:self selectedButton:[[[NSUserDefaults standardUserDefaults] objectForKey:@"ListViewButton"] intValue]];
    }
}

- (void)checkButtons:(int)index{
    for (UIButton *allButton in _listButtonArray) {
        [allButton setSelected:NO];
        allButton.userInteractionEnabled = YES;
        
        if ((int)index == allButton.tag) {
            NSLog(@"第%d个按钮应该是红色的",allButton.tag);
            [allButton setSelected:YES];
            allButton.userInteractionEnabled = NO;
        }
    }
    
    for (UILabel *lbl in _listNameArray) {
        lbl.textColor = [UIColor grayColor];
        
        if ((int)index == lbl.tag) {
            NSLog(@"第%d个按钮的文字应该是红色的",lbl.tag);
            lbl.textColor = [UIColor redColor];
        }
    }
}

@end
