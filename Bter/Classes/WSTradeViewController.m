//
//  WSTradeViewController.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSTradeViewController.h"

@interface WSTradeViewController ()

- (IBAction)loadTrade:(id)sender;

@end

@implementation WSTradeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loadTrade:(id)sender {
    [self loadDataWithTemplate:kTrade withURL:datasource[[self.currAPicker selectedRowInComponent:0]] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
