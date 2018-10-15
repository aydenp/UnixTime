//
//  InterfaceController.m
//  UnixTime WatchKit Extension
//
//  Created by AppleBetas on 2018-10-14.
//  Copyright © 2018 AppleBetas. All rights reserved.
//

#import "InterfaceController.h"
#import "ABUnixStringTimeProvider.h"
#import "ABJavaScriptStringTimeProvider.h"
#import "ABAppleStringTimeProvider.h"

@interface InterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *prefaceLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *dateLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *bottomSpacer;
@end

@implementation InterfaceController {
    NSArray<NSObject<ABStringTimeProvider> *> *providers;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        providers = @[[ABUnixStringTimeProvider new], [ABJavaScriptStringTimeProvider new], [ABAppleStringTimeProvider new]];
    }
    return self;
}
    
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    self.provider = [providers firstObject];
    [NSTimer scheduledTimerWithTimeInterval:1 / 60 target:self selector:@selector(updateTimestamp) userInfo:nil repeats:YES];
}

- (void)didAppear {
    [super didAppear];
    
    // Hack to hide the status bar without going full-screen (because we're not SpriteKit)
    id statusBarWindow = [[NSClassFromString(@"UIApplication") performSelector:@selector(sharedApplication)] performSelector:@selector(statusBarWindow)];
    [statusBarWindow setAlpha:0];
    
    // Set our bottom spacer to half the status bar height to offset our text to the middle of the screen (ew)
    [_bottomSpacer setHeight:[[(NSArray *)[statusBarWindow performSelector:@selector(subviews)] firstObject] frame].size.height / 2];
}

- (void)setProvider:(NSObject<ABStringTimeProvider> *)provider {
    _provider = provider;
    if (!provider) return;
    [_prefaceLabel setAttributedText:[self attributedStringForString:provider.prefacedString]];
    [_prefaceLabel setTextColor:provider.textColour];
    [_dateLabel setTextColor:provider.textColour];
    [self updateTimestamp];
}
    
- (IBAction)switchMode {
    NSMutableArray<WKAlertAction *> *actions = [NSMutableArray array];
    for (NSObject<ABStringTimeProvider> *provider in providers) {
        [actions addObject:[WKAlertAction actionWithTitle:provider.title style:WKAlertActionStyleDefault handler:^{
            self.provider = provider;
        }]];
    }
    [self presentAlertControllerWithTitle:@"Select a new time mode" message:nil preferredStyle:WKAlertControllerStyleActionSheet actions:actions];
    
}
    
- (void)updateTimestamp {
    NSAttributedString *text = [self attributedStringForString:_provider ? [_provider stringForDate:[NSDate date]] : nil];
    [_dateLabel setAttributedText:text];
}

- (NSAttributedString *)attributedStringForString:(NSString *)string {
    return [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SFMono-Regular" size:18]}];
}

@end
