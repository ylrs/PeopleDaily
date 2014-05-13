//
//  ProductGridViewCell.m
//  51free
//
//  Created by yyxj yy on 13-11-27.
//  Copyright (c) 2013年 yyxj yy. All rights reserved.
//

#import "ListenNewsViewCell.h"

@implementation ListenNewsViewCell
@synthesize imageV,label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id) initWithFrame: (CGRect) frame reuseIdentifier: (NSString *) reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160*2, 95*2)];
//        imageV.contentMode = UIViewContentModeScaleAspectFit;
        label = [[UILabel alloc] initWithFrame:CGRectMake(160*2+10, 0, MAINSCREEN_WIDTH/2-160*2-10, 20)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:imageV];
        [self.contentView addSubview:label];
    }
    return  self;
}
@end
