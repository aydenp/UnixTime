//
//  ABUnixStringTimeProvider.m
//  UnixTime WatchKit Extension
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import "ABUnixStringTimeProvider.h"

@implementation ABUnixStringTimeProvider

- (NSString *)stringForDate:(NSDate *)date {
    NSTimeInterval unix = [NSDate date].timeIntervalSince1970;
    return [NSString stringWithFormat:@"%.f", unix];
}

- (NSString *)prefacedString {
    return @"$ date +%s";
}
    
- (NSString *)title {
    return @"Unix";
}

- (UIColor *)textColour {
    return [UIColor greenColor];
}

@end
