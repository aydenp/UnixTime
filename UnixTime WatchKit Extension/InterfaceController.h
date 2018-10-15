//
//  InterfaceController.h
//  UnixTime WatchKit Extension
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "ABStringTimeProvider.h"

@interface InterfaceController : WKInterfaceController
@property (nonatomic, retain) NSObject<ABStringTimeProvider> *provider;
@end
