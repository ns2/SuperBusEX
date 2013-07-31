//
//  BusSearchDetailedViewController.m
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import "BusSearchDetailedViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BusSearchDetailedViewController ()

@end

@implementation BusSearchDetailedViewController
@synthesize stationsView = _stationsView;
@synthesize stationsScrollView = _stationsScrollView;
@synthesize stationList = _stationList;
@synthesize stationName;
@synthesize lineState;

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
    CGFloat fontSize,verticalSpaceSize;
    CGFloat backgroundRed,backgroundGreen,backgroundBlue;
    
    backgroundRed = 225.f;//231.0f;
    backgroundGreen = 225.0f;//179.0f;
    backgroundBlue = 225.0f;//37.0f;
    
    fontSize = 13.0f;
    verticalSpaceSize = 45.0f;
    
    self.stationList = [NSArray arrayWithObjects:@"第一站要最最长",@"第二站",@"第三站一点",@"第四站长乐",@"第五站长一点",@"第一站要最最长",@"第二站",@"第三站一点",@"第四站长乐",@"第五站长一点",@"第一站要最最长",@"第二站",@"第三站一点",@"第四站长乐",@"第五站长一点", nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:backgroundRed/255.0f
                                                green:backgroundGreen/255.0f
                                                 blue:backgroundBlue/255.0f
                                                alpha:1.0f];
	// init the station scroll view, put it on the center of the parent view
    self.stationsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f,
                                                                            self.view.bounds.size.height * 1.0f/ 3.0f - 30.0f,
                                                                            self.view.bounds.size.width,
                                                                             self.view.bounds.size.height / 3.0f + 30.0f)];
    [self.view addSubview:self.stationsScrollView];
    
    CGRect stationScrollRect = self.stationsScrollView.bounds;
    self.stationsView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 verticalSpaceSize*self.stationList.count + 40.0f,
                                                                 stationScrollRect.size.height)];
    self.stationsScrollView.contentSize = self.stationsView.bounds.size;
    self.stationsScrollView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.3f];
    [self.stationsScrollView addSubview:self.stationsView];
    
    
    //fill the station scroll view with the station name
    for (int i = 0;i<self.stationList.count; i++){
        UILabel *stationNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * verticalSpaceSize + 30.0f,
                                                                             50.0f,
                                                                             20.0f,
                                                                              130.0f)];
        NSString *stationName = [self.stationList objectAtIndex:i];
        NSMutableString *stationText = [[NSMutableString alloc] initWithString:@""];
        for (int j=0;j<stationName.length;j++){
            [stationText appendString:[stationName substringWithRange:NSMakeRange(j, 1)]];
            [stationText appendString:@"\n"];
        }
        for (int j=0;j<7-stationName.length;j++){
            [stationText appendString:@"\n"];
        }
        stationNameLabel.text = stationText;
        stationNameLabel.textColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
        stationNameLabel.backgroundColor = [UIColor clearColor];
        stationNameLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:fontSize];
        stationNameLabel.numberOfLines = 7;
        [self.stationsView addSubview:stationNameLabel];
        
        //add icon for each bus station
        UIImage *stationIcon = [UIImage imageNamed:@"bus_icon_clicked.png"];
        UIImageView *stationIconView = [[UIImageView alloc] initWithFrame:CGRectMake(i * verticalSpaceSize + 26.0f,
                                                                                     33.0f,
                                                                                     fontSize * 1.7f,
                                                                                     fontSize * 1.7f)];
        //add shallow to the bus icon
        stationIconView.image = stationIcon;
        CALayer* containerLayer = [CALayer layer];
        containerLayer.shadowColor = [UIColor blackColor].CGColor;
        containerLayer.shadowRadius = 1.f;
        containerLayer.shadowOffset = CGSizeMake(0.f, 5.f);
        containerLayer.shadowOpacity = 1.f;
        stationIconView.layer.masksToBounds = YES;
        [containerLayer addSublayer:stationIconView.layer];
        [self.stationsScrollView.layer addSublayer:containerLayer];
        
        //icon loading finished, add it to the subview of station view
        [self.stationsScrollView addSubview:stationIconView];
    }
    
    //load the triangle for bus station and enables the animation
    UIImage *lengthImage = [UIImage imageNamed:@"gray square.jpg"];
    UIImageView *lengthImageView = [[UIImageView alloc] initWithFrame:CGRectMake(19.f,
                                                                                12.5f,
                                                                                [self.stationList count] * verticalSpaceSize,
                                                                                3.0f)];
    lengthImageView.image = lengthImage;
    [self.stationsScrollView addSubview:lengthImageView];
    
    UIImage *trianlgeImage = [UIImage imageNamed:@"triangle4.png"];
    UIImageView *triangleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28.5f,
                                                                                   13.0f,
                                                                                   fontSize,
                                                                                   fontSize)];
    triangleImageView.image = trianlgeImage;
    [self.stationsScrollView addSubview:triangleImageView];
    
    //load the text for bus information
    self.busStationNav.title = [self getNavText];
    
    //load the start name and end name for the bus line
    self.startStationLabel.text = [self getStartStationName];
    self.startStationLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:fontSize];
    self.endStationLabel.text = [self getEndStationName];
    self.endStationLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:fontSize];
    
    //load the line name information
    self.stationNameLabel.text = [self getStationName];
    self.stationNameLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:30.0f];
    self.stationNameLabel.backgroundColor = self.view.backgroundColor;
    
}

-(NSString *)getNavText{
    return @"公交线路信息";
}
                                  
-(NSString *)getStationName{
    return @"960路";
}

-(NSString *)getStartStationName{
    return @"始发站名称";
}

-(NSString *)getEndStationName{
    return @"终点站名称";
}

-(void)onBusStationSelected{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
