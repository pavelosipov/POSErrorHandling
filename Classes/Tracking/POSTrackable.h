//
//  POSTrackable.h
//  POSErrorHandling
//
//  Created by Pavel Osipov on 22.01.16.
//  Copyright © 2018 Pavel Osipov. All rights reserved.
//

#import "POSContracts.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, POSTrackableType) {
    POSTrackableTypeEvent    = 1 << 0,
    POSTrackableTypeError    = 1 << 1,
    POSTrackableTypeIncident = 1 << 2
};

typedef NSDictionary<NSString *, id<NSObject>> POSTrackableParams;

/// Represents object, which can be tracked in the tracking services.
@protocol POSTrackable <NSObject>

/// Type of event instance.
@property (nonatomic, readonly) POSTrackableType type;

/// Unique human-readable identifier of the event in the tracking system.
@property (nonatomic, readonly) NSString *name;

/// Tags that help distinguish events with the same name.
@property (nonatomic, readonly, nullable) NSArray<NSString *> *tags;

/// Unstructured human-readable description of the event.
@property (nonatomic, readonly, nullable) NSString *message;

/// @brief      Additional event parameters.
/// @discussion Values will be be represented as text using [NSObject description]
///             method. The only exception is NSDictionary. Pairs of the dictionary
///             will be used to fill properties of the trackable event instead of the
///             dictionary text representation.
@property (nonatomic, readonly, nullable) POSTrackableParams *params;

/// Underlying reason for the trackable.
@property (nonatomic, readonly, nullable) id<POSTrackable> underlyingTrackable;

@end

NS_ASSUME_NONNULL_END
