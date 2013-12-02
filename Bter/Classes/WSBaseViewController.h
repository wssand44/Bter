//
//  WSBaseViewController.h
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WSPickerDataSource.h"

#import "UIActivityIndicatorView+AFNetworking.h"

@interface WSBaseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *currAPicker;

@property (strong, nonatomic) WSPickerDataSource *datasource;

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

- (BOOL)isSuccessLoadData:(id)resposeObj;

- (void)showError:(NSString *)error;

- (void)loadDataWithTemplate:(NSString *)templateName withURL:(NSString *)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
