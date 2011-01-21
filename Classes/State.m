//
//  State.m
//  MyEvents
//
//  Created by Kiel Oleson on 2011-01-19.
//  Copyright (c) 2011 Eventbrite. All rights reserved.
//

#import "State.h"


@implementation State
@dynamic currentAttendee;
@dynamic currentOrder;

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (Attendee *)currentAttendee {
    id tmpObject;
    
    [self willAccessValueForKey:@"currentAttendee"];
    tmpObject = [self primitiveCurrentAttendee];
    [self didAccessValueForKey:@"currentAttendee"];
    
    return tmpObject;
}

- (void)setCurrentAttendee:(Attendee *)value {
    [self willChangeValueForKey:@"currentAttendee"];
    [self setPrimitiveCurrentAttendee:value];
    [self didChangeValueForKey:@"currentAttendee"];
}

- (BOOL)validateCurrentAttendee:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}


- (Order *)currentOrder {
    id tmpObject;
    
    [self willAccessValueForKey:@"currentOrder"];
    tmpObject = [self primitiveCurrentOrder];
    [self didAccessValueForKey:@"currentOrder"];
    
    return tmpObject;
}

- (void)setCurrentOrder:(Order *)value {
    [self willChangeValueForKey:@"currentOrder"];
    [self setPrimitiveCurrentOrder:value];
    [self didChangeValueForKey:@"currentOrder"];
}

- (BOOL)validateCurrentOrder:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

#endif

@end
