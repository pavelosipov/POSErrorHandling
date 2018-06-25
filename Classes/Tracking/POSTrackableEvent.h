//
//  POSTrackableEvent.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 22.01.16.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSTrackable.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSDictionary<NSString *, id<NSObject>> POSTrackableEventUserInfo;

@interface POSTrackableEvent : NSObject <POSTrackable>

@property (nonatomic, readonly, nullable) POSTrackableEventUserInfo *userInfo;

- (instancetype)initWithName:(NSString *)name
                 incidential:(BOOL)incidential
                        tags:(nullable NSArray<NSString *> *)tags
                     message:(nullable NSString *)message
                      params:(nullable POSTrackableParams *)params
                    userInfo:(nullable POSTrackableEventUserInfo *)userInfo NS_DESIGNATED_INITIALIZER;

POS_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
