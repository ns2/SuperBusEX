//
//  BusViewController.m
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import "BusViewController.h"


@interface BusViewController ()

@end

@implementation BusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showTablePressed:(UIButton *)sender {
    NSLog(@"test");
    TableViewController *tableView=[[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    tableView.modalPresentationStyle=UIModalPresentationCurrentContext;
    tableView.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:tableView animated:YES completion:nil];
    

    
    

}

@end
