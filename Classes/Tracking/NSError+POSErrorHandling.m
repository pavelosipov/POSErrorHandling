//
//  NSError+POSErrorHandling.m
//  POSErrorHandling
//
//  Created by Pavel Osipov on 27.01.16.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "NSError+POSErrorHandling.h"
#import "NSException+POSErrorHandling.h"

NS_ASSUME_NONNULL_BEGIN

// Categories
NSString * const kPOSInternalErrorCategory = @"Internal";
NSString * const kPOSSystemErrorCategory = @"System";

// Public keys
NSString * const kPOSTrackableDescriptionKey = @"VerboseDescription";
NSString * const kPOSTrackableParamsKey = @"TrackableParams";
NSString * const kPOSTrackableTagsKey = @"TrackableTags";

// Private keys
static NSString * const kPOSCategoryKey = @"Category";
static NSString * const kPOSIncidentMarkKey = @"IncidentMark";

@implementation NSError (POSErrorHandling)

#pragma mark - Public

- (NSString *)pos_category {
    return self.userInfo[kPOSCategoryKey] ?: self.domain;
}

+ (NSError *)pos_internalErrorWithFormat:(nullable NSString *)format, ... {
    NSString *description = nil;
    if (format) {
        va_list args;
        va_start(args, format);
        description = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    }
    return [self pos_errorWithCategory:kPOSInternalErrorCategory
                              userInfo:(description ? @{kPOSTrackableDescriptionKey : description} : nil)];
}

+ (NSError *)pos_systemErrorWithReason:(nullable NSError *)reason {
    return [self pos_errorWithCategory:kPOSSystemErrorCategory userInfo:(reason ? @{NSUnderlyingErrorKey : reason} : nil)];
}

+ (NSError *)pos_systemErrorWithFormat:(nullable NSString *)format, ... {
    NSString *description = nil;
    if (format) {
        va_list args;
        va_start(args, format);
        description = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    }
    return [self pos_errorWithCategory:kPOSSystemErrorCategory
                              userInfo:(description ? @{kPOSTrackableDescriptionKey : description} : nil)];
}

+ (NSError *)pos_errorWithCategory:(NSString *)category {
    return [self pos_errorWithCategory:category userInfo:nil];
}

+ (NSError *)pos_errorWithCategory:(NSString *)category reason:(nullable NSError *)reason {
    return [self pos_errorWithCategory:category userInfo:(reason ? @{NSUnderlyingErrorKey : reason} : nil)];
}

+ (NSError *)pos_errorWithCategory:(NSString *)category userInfo:(nullable NSDictionary *)userInfo {
    NSMutableDictionary *info = userInfo ? [userInfo mutableCopy] : [NSMutableDictionary new];
    info[kPOSCategoryKey] = category;
    return [[NSError alloc] initWithDomain:kPOSErrorDomain code:(category.hash % 1000) userInfo:info];
}

+ (NSError *)pos_incidentWithCategory:(NSString *)category reason:(nullable NSError *)reason {
    return [self pos_incidentWithCategory:category userInfo:(reason ? @{NSUnderlyingErrorKey : reason} : nil)];
}

+ (NSError *)pos_incidentWithCategory:(NSString *)category userInfo:(nullable NSDictionary *)userInfo {
    NSMutableDictionary *info = userInfo ? [userInfo mutableCopy] : [NSMutableDictionary new];
    info[kPOSIncidentMarkKey] = @YES;
    return [self pos_errorWithCategory:category userInfo:info];
}

#pragma mark - POSTrackable

- (POSTrackableType)type {
    return POSTrackableTypeError | ([self.userInfo[kPOSIncidentMarkKey] boolValue] ? POSTrackableTypeIncident : 0);
}

- (NSString *)name {
    return self.pos_category;
}

- (nullable NSArray<NSString *> *)tags {
    if (self.userInfo[kPOSCategoryKey] != nil) {
        return self.userInfo[kPOSTrackableTagsKey];
    }
    return @[@(self.code).stringValue];
}

- (nullable NSString *)message {
    return self.userInfo[kPOSTrackableDescriptionKey] ?: self.localizedDescription;
}

- (nullable NSDictionary<NSString *,id<NSObject>> *)params {
    return self.userInfo[kPOSTrackableParamsKey];
}

- (nullable id<POSTrackable>)underlyingTrackable {
    return self.userInfo[NSUnderlyingErrorKey];
}

@end

NS_ASSUME_NONNULL_END
