//
//  WSBaseViewController.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSBaseViewController.h"

@interface WSBaseViewController () <WSPickerDataSourceDelegate>

@end

@implementation WSBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _datasource = [[WSPickerDataSource alloc] init];
    _datasource.delegate = self;
    self.currAPicker.dataSource = self.datasource;
    self.currAPicker.delegate   = self.datasource;
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:_activityIndicatorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showError:(NSString *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}

- (BOOL)isSuccessLoadData:(id)resposeObj
{
    return [[((NSDictionary *)resposeObj) objectForKey:@"result"] boolValue];
}


- (void)loadDataWithTemplate:(NSString *)templateName withURL:(NSString *)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    url = [url stringByReplacingOccurrencesOfString:kTemplate withString:templateName];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    //set headers
    NSString *contentType = [NSString stringWithFormat:@"text/xml"];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [request addValue:@"Bter.iOS" forHTTPHeaderField: @"User-Agent"];
    [request addValue:[NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]] forHTTPHeaderField:@"nouce"];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    
    [self.activityIndicatorView setAnimatingWithStateOfOperation:operation];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.operationQueue cancelAllOperations];
    [manager.operationQueue addOperation:operation];
}

@end
