//
//  NSString+POSErrorHandling.h
//  POSErrorHandling
//
//  Created by p.osipov on 03/08/2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (POSErrorHandling)

- (nullable NSString *)pos_localizedInBundle:(NSString *)bundleName table:(NSString *)table;

@end

NS_ASSUME_NONNULL_END
