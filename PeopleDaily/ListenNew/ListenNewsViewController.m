//
//  DailyHomeViewController.m
//  PeopleDaily
//
//  Created by YLRS on 5/11/14.
//  Copyright (c) 2014 YLRS. All rights reserved.
//

#import "ListenNewsViewController.h"
#import "ListenDetailNewsViewController.h"
#import "ListenNewsViewCell.h"

@interface ListenNewsViewController ()

@end

@implementation ListenNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor clearColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createAQGridView];
    UILabel *listenLabel = [[UILabel alloc] init];
    listenLabel.frame = CGRectMake(30, 40, 80, 30);
    listenLabel.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:listenLabel];
    productsDataArray = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{

}
- (void)createAQGridView{

    listenNewsView = [[AQGridView alloc] initWithFrame:CGRectMake(0, 20, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT)];
    listenNewsView.delegate = self;
    listenNewsView.dataSource = self;
    listenNewsView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:listenNewsView];
    // 注意：第一次得刷新，否则不会显示
    [listenNewsView reloadData];
}

-(NSUInteger)numberOfItemsInGridView:(AQGridView *)gridView
{
    return 8;
}
-(AQGridViewCell *) gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index
{
    static NSString *mark = @"ProductCell";
    ListenNewsViewCell *cell = (ListenNewsViewCell *)[gridView dequeueReusableCellWithIdentifier:mark];
    if (cell == nil) {
        cell = [[ListenNewsViewCell alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH/2-30, 170) reuseIdentifier:mark];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",index+1]];
    cell.catagoryLabel.text = @"今日声音";
    cell.selectionGlowColor = [UIColor clearColor];
    cell.titleLabel.text = @"实拍印度火车与火车站内实景";
    cell.dateLabel.text = @"2014.05.13 17:53";
    cell.sizeLabel.text = @"0.6M";
    
    return cell;
}
-(void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index
{
    ListenDetailNewsViewController *detilNews = [[ListenDetailNewsViewController alloc] init];
    [self.navigationController pushViewController:detilNews animated:YES];

}
-(CGSize)portraitGridCellSizeForGridView:(AQGridView *)gridView
{
    return CGSizeMake(MAINSCREEN_WIDTH/2, 170);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
