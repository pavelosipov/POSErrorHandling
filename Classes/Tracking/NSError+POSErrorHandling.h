//
//  NSError+POSErrorHandling.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 27.01.16.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSTrackable.h"

NS_ASSUME_NONNULL_BEGIN

/// Domain for all trackable errors.
FOUNDATION_EXTERN NSString * const kPOSErrorDomain;

/// Category of internal errors.
FOUNDATION_EXTERN NSString * const kPOSInternalErrorCategory;

/// Category of system errors.
FOUNDATION_EXTERN NSString * const kPOSSystemErrorCategory;

/// Key for error category in userInfo dictionary.
FOUNDATION_EXTERN NSString * const kPOSCategoryKey;

/// Key for human readable description of the problem in userInfo dictionary.
FOUNDATION_EXPORT NSString * const kPOSTrackableDescriptionKey;

/// Key for POSTrackableParams with error parameters in userInfo dictionary.
FOUNDATION_EXPORT NSString * const kPOSTrackableParamsKey;

/// Key for NSArray<NSString *> with trackable tags in userInfo dictionary.
FOUNDATION_EXPORT NSString * const kPOSTrackableTagsKey;

/// Represents interface with common properties in SDK.
@interface NSError (POSErrorHandling) <POSTrackable>

/// Unique string for each kind of the error, for example "System".
@property (nonatomic, readonly) NSString *pos_category;

/// Factory method for internal errors.
+ (NSError *)pos_internalErrorWithFormat:(nullable NSString *)format, ...;

/// Factory method for system errors.
+ (NSError *)pos_systemErrorWithReason:(nullable NSError *)reason;

/// Factory method for system errors.
+ (NSError *)pos_systemErrorWithFormat:(nullable NSString *)format, ...;

/// Creates trackable error without incident identifier.
+ (NSError *)pos_errorWithCategory:(NSString *)category;

/// Creates trackable error without incident identifier.
+ (NSError *)pos_errorWithCategory:(NSString *)category reason:(nullable NSError *)reason;

/// Creates trackable error without incident identifier.
+ (NSError *)pos_errorWithCategory:(NSString *)category userInfo:(nullable NSDictionary *)userInfo;

/// Creates trackable error with incident identifier and reason.
+ (NSError *)pos_incidentWithCategory:(NSString *)category reason:(nullable NSError *)reason;

/// Creates trackable error with incident identifier.
+ (NSError *)pos_incidentWithCategory:(NSString *)category userInfo:(nullable NSDictionary *)userInfo;

@end

NS_INLINE void POSAssignError(NSError **targetError, NSError *sourceError) {
    if (targetError) {
        *targetError = sourceError;
    }
}

NS_ASSUME_NONNULL_END
