//
//  POSTrackableEventBuilder.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 25.06.2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSTrackableEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface POSTrackableEventBuilder : NSObject

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

- (instancetype)withTags:(nullable NSArray<NSString *> *)tags;
- (instancetype)withMessage:(nullable NSString *)message;
- (instancetype)withParams:(nullable POSTrackableParams *)params;
- (instancetype)withUserInfo:(nullable POSTrackableEventUserInfo *)userInfo;
- (instancetype)markAsIncident:(BOOL)incidentMark;

- (POSTrackableEvent *)build;

POS_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
