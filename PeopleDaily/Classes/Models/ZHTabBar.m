//
//  ZHTabBar.m
//  PeopleDaily
//
//  Created by hapame on 14-5-13.
//  Copyright (c) 2014年 YLRS. All rights reserved.
//

#import "ZHTabBar.h"

@implementation ZHTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.868 alpha:1.000];
        UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
        listButton.frame = CGRectMake(10, 4, 36, 36);
        listButton.tag = 1;
        [listButton setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
        [listButton addTarget:self action:@selector(listButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:listButton];
    }
    return self;
}

- (void)listButtonPressed:(UIButton *)item{
    if ([self.delegate respondsToSelector:@selector(zhTabbar:didPressedButton:index:)]) {
        [self.delegate zhTabbar:self didPressedButton:item index:item.tag];
    }
}

@end
