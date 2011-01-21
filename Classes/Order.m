//
//  Order.m
//  MyEvents
//
//  Created by Kiel Oleson on 2011-01-19.
//  Copyright (c) 2011 Eventbrite. All rights reserved.
//

#import "Order.h"


@implementation Order
@dynamic id;
@dynamic startDate;
@dynamic venueName;
@dynamic eventName;
@dynamic attendee;
@dynamic referencingState;
@dynamic tickets;

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (NSString *)id {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"id"];
    tmpValue = [self primitiveId];
    [self didAccessValueForKey:@"id"];
    
    return tmpValue;
}

- (void)setId:(NSString *)value {
    [self willChangeValueForKey:@"id"];
    [self setPrimitiveId:value];
    [self didChangeValueForKey:@"id"];
}

- (BOOL)validateId:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSDate *)startDate {
    NSDate * tmpValue;
    
    [self willAccessValueForKey:@"startDate"];
    tmpValue = [self primitiveStartDate];
    [self didAccessValueForKey:@"startDate"];
    
    return tmpValue;
}

- (void)setStartDate:(NSDate *)value {
    [self willChangeValueForKey:@"startDate"];
    [self setPrimitiveStartDate:value];
    [self didChangeValueForKey:@"startDate"];
}

- (BOOL)validateStartDate:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)venueName {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"venueName"];
    tmpValue = [self primitiveVenueName];
    [self didAccessValueForKey:@"venueName"];
    
    return tmpValue;
}

- (void)setVenueName:(NSString *)value {
    [self willChangeValueForKey:@"venueName"];
    [self setPrimitiveVenueName:value];
    [self didChangeValueForKey:@"venueName"];
}

- (BOOL)validateVenueName:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)eventName {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"eventName"];
    tmpValue = [self primitiveEventName];
    [self didAccessValueForKey:@"eventName"];
    
    return tmpValue;
}

- (void)setEventName:(NSString *)value {
    [self willChangeValueForKey:@"eventName"];
    [self setPrimitiveEventName:value];
    [self didChangeValueForKey:@"eventName"];
}

- (BOOL)validateEventName:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (Attendee *)attendee {
    id tmpObject;
    
    [self willAccessValueForKey:@"attendee"];
    tmpObject = [self primitiveAttendee];
    [self didAccessValueForKey:@"attendee"];
    
    return tmpObject;
}

- (void)setAttendee:(Attendee *)value {
    [self willChangeValueForKey:@"attendee"];
    [self setPrimitiveAttendee:value];
    [self didChangeValueForKey:@"attendee"];
}

- (BOOL)validateAttendee:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}


- (State *)referencingState {
    id tmpObject;
    
    [self willAccessValueForKey:@"referencingState"];
    tmpObject = [self primitiveReferencingState];
    [self didAccessValueForKey:@"referencingState"];
    
    return tmpObject;
}

- (void)setReferencingState:(State *)value {
    [self willChangeValueForKey:@"referencingState"];
    [self setPrimitiveReferencingState:value];
    [self didChangeValueForKey:@"referencingState"];
}

- (BOOL)validateReferencingState:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}


- (void)addTicketsObject:(Ticket *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    
    [self willChangeValueForKey:@"tickets" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveTickets] addObject:value];
    [self didChangeValueForKey:@"tickets" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    
    [changedObjects release];
}

- (void)removeTicketsObject:(Ticket *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    
    [self willChangeValueForKey:@"tickets" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveTickets] removeObject:value];
    [self didChangeValueForKey:@"tickets" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    
    [changedObjects release];
}

- (void)addTickets:(NSSet *)value {    
    [self willChangeValueForKey:@"tickets" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveTickets] unionSet:value];
    [self didChangeValueForKey:@"tickets" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeTickets:(NSSet *)value {
    [self willChangeValueForKey:@"tickets" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveTickets] minusSet:value];
    [self didChangeValueForKey:@"tickets" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}

#endif

@end
