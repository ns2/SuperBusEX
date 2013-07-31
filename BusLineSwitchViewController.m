//
//  BusLineSwitchViewController.m
//  SuperBus
//
//  Created by Kenchy on 13-7-31.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import "BusLineSwitchViewController.h"
#import "TableViewController.h"

@interface BusLineSwitchViewController ()

@end

@implementation BusLineSwitchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    TableViewController *tableView=[[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    tableView.modalPresentationStyle=UIModalPresentationCurrentContext;
    tableView.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self.view addSubview: tableView];
  //  [self presentViewController:tableView animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
