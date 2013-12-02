//
//  WSFirstViewController.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSTickerViewController.h"

#import "WSPickerDataSource.h"

@interface WSTickerViewController () <UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lastLabel;

@property (strong, nonatomic) IBOutlet UILabel *highLabel;

@property (strong, nonatomic) IBOutlet UILabel *lowLabel;

@property (strong, nonatomic) IBOutlet UILabel *buyLabel;

@property (strong, nonatomic) IBOutlet UILabel *sellLabel;

- (IBAction)loadCurrent:(id)sender;

@end

@implementation WSTickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGPoint center = self.view.center;
    center.y -= 120.f;
    self.activityIndicatorView.center = center;
    [self loadCurrent:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)loadCurrent:(id)sender {
    __weak WSTickerViewController *weakself = self;
    [self loadDataWithTemplate:kTicker withURL:datasource[[self.currAPicker selectedRowInComponent:0]] success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *result = (NSDictionary *)responseObject;
        if ([weakself isSuccessLoadData:responseObject]) {
            [weakself setResult:result];
        }else {
            [weakself showError:[result objectForKey:@"message"]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakself showError:[error description]];
    }];
}

- (void)setResult:(NSDictionary *)result
{
    self.lastLabel.text = [NSString stringWithFormat:@"%@", [result objectForKey:@"last"]];
    self.highLabel.text = [NSString stringWithFormat:@"%@", [result objectForKey:@"high"]];
    self.lowLabel.text  = [NSString stringWithFormat:@"%@", [result objectForKey:@"low"]];
    self.buyLabel.text  = [NSString stringWithFormat:@"%@", [result objectForKey:@"buy"]];
    self.sellLabel.text = [NSString stringWithFormat:@"%@", [result objectForKey:@"sell"]];
}

- (void)resetTitle:(NSInteger)row
{
    self.navigationItem.title = [NSString stringWithFormat:@"交易类型：%@", [self.datasource pickerTitleForRow:row]];
}

#pragma mark delegate
- (void)didSelectRow:(NSInteger)row
{
    [self resetTitle:row];
    [self loadCurrent:nil];
}

@end
