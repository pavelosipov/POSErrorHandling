//
//  POSConsoleLogger.m
//  POSErrorHandling
//
//  Created by Pavel Osipov on 09/08/2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSConsoleLogger.h"

NS_ASSUME_NONNULL_BEGIN

@implementation POSConsoleLogger

- (void)logError:(nullable NSString *)format, ... {
    if (format) {
        va_list args;
        va_start(args, format);
        NSLog(@"[ERROR]:%@", [[NSString alloc] initWithFormat:format arguments:args]);
        va_end(args);
    }
}

- (void)logInfo:(nullable NSString *)format, ... {
    if (format) {
        va_list args;
        va_start(args, format);
        NSLog(@"%@", [[NSString alloc] initWithFormat:format arguments:args]);
        va_end(args);
    }
}

@end

NS_ASSUME_NONNULL_END
