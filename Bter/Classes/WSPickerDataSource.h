//
//  WSPickerDataSource.h
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WSPickerDataSourceDelegate <NSObject>

@optional
- (void)didSelectRow:(NSInteger)row;

@end

@interface WSPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) id<WSPickerDataSourceDelegate> delegate;

- (NSString *)pickerTitleForRow:(NSInteger)row;

@end
