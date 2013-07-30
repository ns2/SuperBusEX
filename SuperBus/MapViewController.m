//
//  MapViewController.m
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView=_mapView;

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
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:31.303672
                                                            longitude:121.495185
                                                                zoom:16];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
    self.mapView.settings.zoomGestures=YES;

    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(31.303672,121.495185);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = self.mapView;
    
    
    //get data from webservice here
    NSMutableArray *xarray = [NSMutableArray  array];
    NSMutableArray *yarray=[NSMutableArray array];
    int length=4;
    [xarray addObject:[NSNumber numberWithFloat:31.3]];
    [xarray addObject:[NSNumber numberWithFloat:31.5]];
    [xarray addObject:[NSNumber numberWithFloat:31.6]];
    [xarray addObject:[NSNumber numberWithFloat:31.7]];
    [yarray addObject:[NSNumber numberWithFloat:121.5]];
    [yarray addObject:[NSNumber numberWithFloat:121.52]];
    [yarray addObject:[NSNumber numberWithFloat:121.56]];
    [yarray addObject:[NSNumber numberWithFloat:121.59]];
    
    [self drawPathFromPoints:xarray pointY:yarray ArrayLength:length];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawPathFromPoints:(NSArray *)xarray pointY:(NSArray *)yarray ArrayLength:(int) length
{
    
    
    GMSMutablePath *path = [GMSMutablePath path];
    for (int i=0;i<length;i++)
    {
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake([[xarray objectAtIndex:i] floatValue],
                                                                     [[yarray objectAtIndex:i] floatValue]);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        marker.title = @"Hello World";
        marker.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
        marker.map = self.mapView;
        
        [path addCoordinate:CLLocationCoordinate2DMake([[xarray objectAtIndex:i] floatValue],
                                                       [[yarray objectAtIndex:i] floatValue])];
    }
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeColor=  [UIColor blueColor];
    polyline.strokeWidth=10.f;
    polyline.geodesic= YES;
    polyline.map=self.mapView;
}

@end
