//
//  BusSearchDetailedViewController.h
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusSearchDetailedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *stationsScrollView;
@property (strong, nonatomic)  IBOutlet UIView *stationsView;
@property (strong, nonatomic) NSArray *stationList;
@property (strong, nonatomic) IBOutlet UINavigationItem *busStationNav;
@property (strong, nonatomic) IBOutlet UILabel *startStationLabel;
@property (strong, nonatomic) IBOutlet UILabel *endStationLabel;
@property (strong, nonatomic) IBOutlet UILabel *stationNameLabel;
@end
