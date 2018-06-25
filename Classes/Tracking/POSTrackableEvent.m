//
//  POSTrackableEvent.m
//  POSErrorHandling
//
//  Created by Pavel Osipov on 22.01.16.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSTrackableEvent.h"
#import "NSException+POSErrorHandling.h"

NS_ASSUME_NONNULL_BEGIN

@interface POSTrackableEvent ()

@property (nonatomic, readonly) BOOL incidential;

@end

@implementation POSTrackableEvent

@dynamic type;
@dynamic underlyingTrackable;

@synthesize name = _name;
@synthesize tags = _tags;
@synthesize message = _message;
@synthesize params = _params;

- (instancetype)initWithName:(NSString *)name
                 incidential:(BOOL)incidential
                        tags:(nullable NSArray<NSString *> *)tags
                     message:(nullable NSString *)message
                      params:(nullable POSTrackableParams *)params
                    userInfo:(nullable POSTrackableEventUserInfo *)userInfo {
    POS_CHECK(name);
    if (self = [super init]) {
        _name = name;
        _incidential = incidential;
        _tags = tags;
        _message = message;
        _params = params;
        _userInfo = userInfo;
    }
    return self;
}

#pragma mark - POSTrackable

- (POSTrackableType)type {
    return POSTrackableTypeEvent | (_incidential ? POSTrackableTypeIncident : 0);
}

- (nullable id<POSTrackable>)underlyingTrackable {
    return nil;
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"%@:%@", [super description], [self p_stateDescription]];
}

#pragma mark - Private

- (NSString *)p_stateDescription {
    NSMutableDictionary *state = [NSMutableDictionary new];
    state[@"tags"] = _tags;
    state[@"params"] = _params;
    state[@"message"] = _message;
    state[@"userInfo"] = _userInfo;
    return [state description];
}

@end

NS_ASSUME_NONNULL_END
