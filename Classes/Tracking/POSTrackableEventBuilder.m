//
//  POSTrackableEventBuilder.m
//  POSErrorHandling
//
//  Created by Pavel Osipov on 25.06.2018.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSTrackableEventBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface POSTrackableEventBuilder ()

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, nullable) NSArray<NSString *> *tags;
@property (nonatomic, nullable) NSString *message;
@property (nonatomic, nullable) POSTrackableParams *params;
@property (nonatomic, nullable) POSTrackableEventUserInfo *userInfo;
@property (nonatomic) BOOL incidentMark;

@end

@implementation POSTrackableEventBuilder

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (instancetype)withTags:(nullable NSArray<NSString *> *)tags {
    self.tags = tags;
    return self;
}

- (instancetype)withMessage:(nullable NSString *)message {
    self.message = message;
    return self;
}

- (instancetype)withParams:(nullable POSTrackableParams *)params {
    self.params = params;
    return self;
}

- (instancetype)withUserInfo:(nullable POSTrackableEventUserInfo *)userInfo {
    self.userInfo = userInfo;
    return self;
}

- (instancetype)markAsIncident:(BOOL)incidentMark {
    self.incidentMark = incidentMark;
    return self;
}

- (POSTrackableEvent *)build {
    return [[POSTrackableEvent alloc] initWithName:_name
                                       incidential:_incidentMark
                                              tags:_tags
                                           message:_message
                                            params:_params
                                          userInfo:_userInfo];
}

@end

NS_ASSUME_NONNULL_END
