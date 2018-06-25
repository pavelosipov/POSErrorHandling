//
//  NSException+POSErrorHandling.m
//  POSErrorHandling
//
//  Created by Pavel Osipov on 25.03.15.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "NSException+POSErrorHandling.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSException (POSErrorHandling)

+ (instancetype)pos_exceptionWithFormat:(NSString *)format, ... {
    NSParameterAssert(format);
    va_list args;
    va_start(args, format);
    NSString *reason = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
}

@end

NS_ASSUME_NONNULL_END
