//
//  POSLogger.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 09/08/2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol POSLogger <NSObject>

- (void)logError:(nullable NSString *)format, ...;
- (void)logInfo:(nullable NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END
