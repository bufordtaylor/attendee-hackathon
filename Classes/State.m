//
//  State.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import "State.h"


@implementation State
@dynamic currentAttendee;

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (NSManagedObject *)currentAttendee {
    id tmpObject;
    
    [self willAccessValueForKey:@"currentAttendee"];
    tmpObject = [self primitiveCurrentAttendee];
    [self didAccessValueForKey:@"currentAttendee"];
    
    return tmpObject;
}

- (void)setCurrentAttendee:(NSManagedObject *)value {
    [self willChangeValueForKey:@"currentAttendee"];
    [self setPrimitiveCurrentAttendee:value];
    [self didChangeValueForKey:@"currentAttendee"];
}

- (BOOL)validateCurrentAttendee:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

#endif

@end
