//
//  BusSearchViewController.h
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BusSearchDetailedViewController;

@interface BusSearchViewController : UIViewController

@property (strong,nonatomic) BusSearchDetailedViewController *detailedViewController;
@property (strong,nonatomic) UIActivityIndicatorView *spinner;
@property (retain, nonatomic) NSMutableData *webData;

@end
