//
//  WSSecondViewController.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSDepthViewController.h"

#import "WSPickerDataSource.h"

@interface WSDepthViewController ()

- (IBAction)loadDepth:(id)sender;

@end

@implementation WSDepthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)latestBter
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://bter.com/api/1/depth/btc_cny" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadDepth:(id)sender {
    [self loadDataWithTemplate:kDepth withURL:datasource[[self.currAPicker selectedRowInComponent:0]] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
