//
//  Attendee.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import "Attendee.h"


@implementation Attendee
@dynamic login;
@dynamic passwordToken;
@dynamic firstName;
@dynamic lastName;
@dynamic orders;
@dynamic referencingState;

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (NSString *)login {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"login"];
    tmpValue = [self primitiveLogin];
    [self didAccessValueForKey:@"login"];
    
    return tmpValue;
}

- (void)setLogin:(NSString *)value {
    [self willChangeValueForKey:@"login"];
    [self setPrimitiveLogin:value];
    [self didChangeValueForKey:@"login"];
}

- (BOOL)validateLogin:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)passwordToken {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"passwordToken"];
    tmpValue = [self primitivePasswordToken];
    [self didAccessValueForKey:@"passwordToken"];
    
    return tmpValue;
}

- (void)setPasswordToken:(NSString *)value {
    [self willChangeValueForKey:@"passwordToken"];
    [self setPrimitivePasswordToken:value];
    [self didChangeValueForKey:@"passwordToken"];
}

- (BOOL)validatePasswordToken:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)firstName {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"firstName"];
    tmpValue = [self primitiveFirstName];
    [self didAccessValueForKey:@"firstName"];
    
    return tmpValue;
}

- (void)setFirstName:(NSString *)value {
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveFirstName:value];
    [self didChangeValueForKey:@"firstName"];
}

- (BOOL)validateFirstName:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)lastName {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"lastName"];
    tmpValue = [self primitiveLastName];
    [self didAccessValueForKey:@"lastName"];
    
    return tmpValue;
}

- (void)setLastName:(NSString *)value {
    [self willChangeValueForKey:@"lastName"];
    [self setPrimitiveLastName:value];
    [self didChangeValueForKey:@"lastName"];
}

- (BOOL)validateLastName:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (void)addOrdersObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    
    [self willChangeValueForKey:@"orders" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveOrders] addObject:value];
    [self didChangeValueForKey:@"orders" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    
    [changedObjects release];
}

- (void)removeOrdersObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    
    [self willChangeValueForKey:@"orders" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveOrders] removeObject:value];
    [self didChangeValueForKey:@"orders" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    
    [changedObjects release];
}

- (void)addOrders:(NSSet *)value {    
    [self willChangeValueForKey:@"orders" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveOrders] unionSet:value];
    [self didChangeValueForKey:@"orders" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeOrders:(NSSet *)value {
    [self willChangeValueForKey:@"orders" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveOrders] minusSet:value];
    [self didChangeValueForKey:@"orders" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
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

#endif

@end
