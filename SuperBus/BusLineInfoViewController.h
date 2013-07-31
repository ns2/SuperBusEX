//
//  BusLineInfoViewController.h
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusLineInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *lineNumberText;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (retain, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@end
