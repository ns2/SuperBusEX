//
//  BusLineInfoViewController.m
//  SuperBus
//
//  Created by Kenchy on 13-7-29.
//  Copyright (c) 2013年 finlab. All rights reserved.
//

#import "BusLineInfoViewController.h"
#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface BusLineInfoViewController ()

@end

@implementation BusLineInfoViewController
@synthesize webData;
@synthesize spinner;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchButtonPressed:(UIButton *)sender {
        //请求发送到的路径
    NSURL *url = [NSURL URLWithString:@"http://10.1.105.110/BusServiceTest/Service1.asmx/queryStationNode"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[@"routine_ID=559&diretion=0" dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.spinner setCenter:self.view.center];
    [self.view addSubview:self.spinner];
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        NSLog(@"the connection is complete");
        self.webData = [[NSMutableData alloc] init];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    [self.spinner startAnimating];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(error.description);
    NSLog(@"ERROR with theConenction");
//    [connection release];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.webData setLength: 0];
    NSLog(@"connection: didReceiveResponse:1");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.webData appendData:data];
    NSLog(@"connection: didReceiveData:2");
    NSLog(data.description);
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    NSXMLParser *xmlParser;
    NSLog(@"3 DONE. Received Bytes: %d", [webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(theXML);
    
    //重新加載xmlParser
    GDataXMLDocument *doc=[[GDataXMLDocument alloc] initWithData:webData options:0 error:nil];
    GDataXMLElement *rootElement = [doc rootElement];
    
    NSArray *stations= [rootElement elementsForName:@"string"];
    for (GDataXMLElement *station in stations){
        NSString *stationName = [station stringValue];
        NSLog(stationName);
    }
 
    [self.spinner stopAnimating];
}
@end
