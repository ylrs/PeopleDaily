//
//  ScrollViewCell.h
//  51free
//
//  Created by yyxj yy on 13-12-30.
//  Copyright (c) 2013年 yyxj yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollViewCellDelegate;

@interface ScrollViewCell : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) NSObject <ScrollViewCellDelegate> *delegate;


- (id)initWithData:(NSDictionary *)item index:(NSUInteger)index;


@end
@protocol ScrollViewCellDelegate <NSObject>

- (void)touchGoToScenicView:(id)sender;

@end
