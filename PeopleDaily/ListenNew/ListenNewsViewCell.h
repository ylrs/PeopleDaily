//
//  ProductGridViewCell.h
//  51free
//
//  Created by yyxj yy on 13-11-27.
//  Copyright (c) 2013年 yyxj yy. All rights reserved.
//

#import "AQGridViewCell.h"

@interface ListenNewsViewCell : AQGridViewCell
{
    UIImageView *imageV;
    UILabel *label;
}
@property (nonatomic,retain)  UIImageView *imageV;
@property (nonatomic,retain)  UILabel *catagoryLabel;
@property (nonatomic,retain)  UILabel *titleLabel;
@property (nonatomic,retain)  UILabel *dateLabel;
@property (nonatomic,retain)  UILabel *sizeLabel;
-(id) initWithFrame: (CGRect) frame reuseIdentifier: (NSString *) reuseIdentifier;

@end

