//
//  DailyHomeViewController.h
//  PeopleDaily
//
//  Created by YLRS on 5/11/14.
//  Copyright (c) 2014 YLRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridView.h"
@interface ListenNewsViewController : UIViewController<AQGridViewDelegate,AQGridViewDataSource>
{
    AQGridView *listenNewsView;
    NSMutableArray *productsDataArray;
}
@end
