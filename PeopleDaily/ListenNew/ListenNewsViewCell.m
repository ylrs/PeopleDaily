//
//  ProductGridViewCell.m
//  51free
//
//  Created by yyxj yy on 13-11-27.
//  Copyright (c) 2013年 yyxj yy. All rights reserved.
//

#import "ListenNewsViewCell.h"

@implementation ListenNewsViewCell
@synthesize imageV,titleLabel,catagoryLabel,dateLabel,sizeLabel;

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
        imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160*1.3, 95*1.5)];
        catagoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(160*1.3+20, 0, MAINSCREEN_WIDTH/2-160*1.5-20, 20)];
        catagoryLabel.backgroundColor = [UIColor clearColor];
        catagoryLabel.font = [UIFont systemFontOfSize:12];
        catagoryLabel.textColor = [UIColor grayColor];
        catagoryLabel.textAlignment = NSTextAlignmentLeft;
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160*1.3+20, 20, MAINSCREEN_WIDTH/2-160*1.5-20, 60)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.numberOfLines = 0;
        titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(160*1.3+20, 80, MAINSCREEN_WIDTH/2-160*1.5-20, 20)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.font = [UIFont systemFontOfSize:14];
        dateLabel.textColor = [UIColor grayColor];
        dateLabel.textAlignment = NSTextAlignmentLeft;
        
        sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(160*1.3+20+MAINSCREEN_WIDTH/2-160*1.5-70, 80, 40, 20)];
        sizeLabel.backgroundColor = [UIColor clearColor];
        sizeLabel.font = [UIFont systemFontOfSize:14];
        sizeLabel.textColor = [UIColor grayColor];
        sizeLabel.textAlignment = NSTextAlignmentLeft;
        
        CALayer *subLayer1 = [[CALayer alloc] init];
        subLayer1.frame = CGRectMake(0, 142.5+13.75, MAINSCREEN_WIDTH/2, 1);
        subLayer1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3].CGColor;
        [self.contentView.layer addSublayer:subLayer1];
        
        CALayer *subLayer2 = [[CALayer alloc] init];
        subLayer2.frame = CGRectMake(160*1.3+20+MAINSCREEN_WIDTH/2-160*1.5-70+40+10, 5, 1, 130);
        subLayer2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3].CGColor;
        [self.contentView.layer addSublayer:subLayer2];
        
        [self.contentView addSubview:imageV];
        [self.contentView addSubview:catagoryLabel];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:dateLabel];
        [self.contentView addSubview:sizeLabel];
    }
    return  self;
}
@end
