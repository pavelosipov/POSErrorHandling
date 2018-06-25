//
//  POSContracts.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 01.06.15.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define POS_INIT_UNAVAILABLE \
- (instancetype)init NS_UNAVAILABLE; \
+ (instancetype)new NS_UNAVAILABLE;

#define POS_TRACKABLE_EVENT_INIT_UNAVAILABLE \
- (instancetype)initWithName:(NSString *)name \
                 incidential:(BOOL)incidential \
                        tags:(nullable NSArray<NSString *> *)tags \
                     message:(nullable NSString *)message \
                      params:(nullable NSDictionary *)params \
                    userInfo:(nullable POSTrackableEventUserInfo *)userInfo NS_UNAVAILABLE;
