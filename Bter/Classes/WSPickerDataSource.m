//
//  WSPickerDataSource.m
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import "WSPickerDataSource.h"

@implementation WSPickerDataSource

#pragma mark UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ARRAY_LEN(datasource);
}

#pragma mark picker view delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([self.delegate respondsToSelector:@selector(didSelectRow:)]) {
        [self.delegate didSelectRow:row];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self pickerTitleForRow:row];
}

- (NSString *)pickerTitleForRow:(NSInteger)row
{
    NSString *title = datasource[row];
    title = [[title componentsSeparatedByString:@"/"] lastObject];
    title = [title stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    title = [title uppercaseString];
    return title;
}

@end
