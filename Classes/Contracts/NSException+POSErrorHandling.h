//
//  NSException+POSErrorHandling.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 25.03.15.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSException (POSErrorHandling)

/// Creates exception with specified description.
+ (instancetype)pos_exceptionWithFormat:(NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END

#define POS_CHECK_EX(condition, description, ...) \
do { \
    if (!(condition)) { \
        @throw [NSException pos_exceptionWithFormat:description, ##__VA_ARGS__]; \
    } \
} while (0)

#define POS_CHECK(condition) \
    POS_CHECK_EX(condition, ([NSString stringWithFormat:@"'%s' is false.", #condition]))

#define POS_THROW(description, ...) \
    @throw [NSException pos_exceptionWithFormat:description, ##__VA_ARGS__]

#define POS_THROW_NOT_IMPLEMENTED \
    @throw [NSException pos_exceptionWithFormat:@"%@ is not implemented", NSStringFromSelector(_cmd)]
