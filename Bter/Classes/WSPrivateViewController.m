//
//  WSPrivateViewController.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSPrivateViewController.h"

#import "NSString+AGCategory.h"

@interface WSPrivateViewController ()

@property (nonatomic, retain) NSString *key;

@property (nonatomic, retain) NSString *secret;

@end

@implementation WSPrivateViewController

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
#warning setYou Key and Secret
    _key = @"YourKey";
    _secret = @"YourSecret";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self latestBter];
}

- (void)latestBter
{
    float time = [[NSDate date] timeIntervalSince1970];

    NSString *nouce = [NSString stringWithFormat:@"nouce=%.0f", time];
    
    NSString *sign =  [nouce HMACWithSecret_AG:_secret];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://bter.com/api/1/private/getfunds"]];
    [request setHTTPMethod:@"POST"];
    
    //set headers
    NSString *contentType = [NSString stringWithFormat:@"text/xml"];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [request addValue:@"Bter.iOS" forHTTPHeaderField: @"User-Agent"];
    [request addValue:_key forHTTPHeaderField:@"KEY"];
    [request addValue:sign forHTTPHeaderField:@"SIGN"];
    [request setHTTPBody:[nouce dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
    }];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.operationQueue addOperation:operation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
