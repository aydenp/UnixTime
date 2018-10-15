//
//  ABJavaScriptStringTimeProvider.m
//  UnixTime WatchKit Extension
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import "ABAppleStringTimeProvider.h"

@implementation ABAppleStringTimeProvider

- (NSString *)stringForDate:(NSDate *)date {
    NSTimeInterval time = [NSDate date].timeIntervalSinceReferenceDate;
    return [NSString stringWithFormat:@"%.f", time];
}

- (NSString *)prefacedString {
    return @"Date().timeIntervalSinceReferenceDate";
}
    
- (NSString *)title {
    return @"Apple";
}

- (UIColor *)textColour {
    return [UIColor whiteColor];
}

@end
