//
//  MapViewController.h
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "MapPoint.h"
@interface MapViewController : UIViewController
@property (nonatomic,strong) GMSMapView *mapView;

@end
