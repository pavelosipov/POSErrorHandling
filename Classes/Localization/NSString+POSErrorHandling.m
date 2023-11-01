//
//  NSString+POSErrorHandling.m
//  POSErrorHandling
//
//  Created by p.osipov on 03/08/2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "NSString+POSErrorHandling.h"
#import "POSTrackableEvent.h"
#import "NSException+POSErrorHandling.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSString (POSErrorHandling)

- (nullable NSString *)pos_localizedInBundle:(NSString *)bundleName table:(NSString *)table {
    NSBundle *mainBundle = [NSBundle bundleForClass:POSTrackableEvent.class];
    if (!mainBundle) {
        return nil;
    }

    NSURL *url = [mainBundle URLForResource:@"POSErrorHandling" withExtension:@"bundle"];
    NSBundle *stringBundle = url != nil ? [NSBundle bundleWithURL:url] : mainBundle;

    if (!stringBundle) {
        return nil;
    }
    return [stringBundle localizedStringForKey:self value:nil table:table];
}

@end

NS_ASSUME_NONNULL_END
