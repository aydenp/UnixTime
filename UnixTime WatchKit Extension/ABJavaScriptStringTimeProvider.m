//
//  ABJavaScriptStringTimeProvider.m
//  UnixTime WatchKit Extension
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import "ABJavaScriptStringTimeProvider.h"

@implementation ABJavaScriptStringTimeProvider

- (NSString *)stringForDate:(NSDate *)date {
    NSTimeInterval js = [NSDate date].timeIntervalSince1970 * 1000;
    return [NSString stringWithFormat:@"%.f", js];
}

- (NSString *)prefacedString {
    return @"> Date.now()";
}
    
- (NSString *)title {
    return @"JavaScript";
}

- (UIColor *)textColour {
    return [UIColor cyanColor];
}

@end
