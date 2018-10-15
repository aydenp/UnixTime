//
//  ABStringTimeProvider.h
//  UnixTime
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ABStringTimeProvider <NSObject>
- (NSString *)stringForDate:(NSDate *)date;
- (NSString *)prefacedString;
- (NSString *)title;
- (UIColor *)textColour;
@end
