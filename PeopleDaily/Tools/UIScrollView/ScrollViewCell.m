//
//  ScrollViewCell.m
//  51free
//
//  Created by yyxj yy on 13-12-30.
//  Copyright (c) 2013年 yyxj yy. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell
@synthesize imageView= _imageView;
@synthesize button = _button;
@synthesize delegate = _delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithData:(NSDictionary *)item index:(NSUInteger)index{
    self = [self init];
    if (self) {
        // Initialization code

        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 135)];
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 0, 320, 135)];
        [_button setTag:index];
        [_button addTarget:self action:@selector(goToScenicView) forControlEvents:UIControlEventTouchUpInside];
        

        _imageView.tag = index;
        [self addSubview:_imageView];
        [self addSubview:_button];

        
    }
    return self;
}
- (void)goToScenicView{
    if ([_delegate respondsToSelector:@selector(touchGoToScenicView:)]) {
        [_delegate touchGoToScenicView:_button];
    }
}

@end
