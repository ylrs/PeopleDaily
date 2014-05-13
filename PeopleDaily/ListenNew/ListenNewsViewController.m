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
    productsDataArray = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view.
}
- (void)createAQGridView{

    listenNewsView = [[AQGridView alloc] initWithFrame:CGRectMake(0, 50, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT)];
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
        cell = [[ListenNewsViewCell alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH/2, 250) reuseIdentifier:mark];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",index+1]];
    cell.label.text = @"vihvdifsfjsfsiofusifosidfusifuosidufoibjlxkjoixvooifhsoidh";
    cell.selectionGlowColor = [UIColor clearColor];
    
    return cell;
}
-(void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index
{
    ListenDetailNewsViewController *detilNews = [[ListenDetailNewsViewController alloc] init];
    [self presentViewController:detilNews animated:YES completion:nil];

}
-(CGSize)portraitGridCellSizeForGridView:(AQGridView *)gridView
{
    return CGSizeMake(MAINSCREEN_WIDTH/2, 250);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
