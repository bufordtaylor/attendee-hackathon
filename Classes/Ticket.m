//
//  Ticket.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import "Ticket.h"


@implementation Ticket
@dynamic barcodeNumber;
@dynamic typeName;
@dynamic barcodeImage;
@dynamic order;

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (NSString *)barcodeNumber {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"barcodeNumber"];
    tmpValue = [self primitiveBarcodeNumber];
    [self didAccessValueForKey:@"barcodeNumber"];
    
    return tmpValue;
}

- (void)setBarcodeNumber:(NSString *)value {
    [self willChangeValueForKey:@"barcodeNumber"];
    [self setPrimitiveBarcodeNumber:value];
    [self didChangeValueForKey:@"barcodeNumber"];
}

- (BOOL)validateBarcodeNumber:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSString *)typeName {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"typeName"];
    tmpValue = [self primitiveTypeName];
    [self didAccessValueForKey:@"typeName"];
    
    return tmpValue;
}

- (void)setTypeName:(NSString *)value {
    [self willChangeValueForKey:@"typeName"];
    [self setPrimitiveTypeName:value];
    [self didChangeValueForKey:@"typeName"];
}

- (BOOL)validateTypeName:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSData *)barcodeImage {
    NSData * tmpValue;
    
    [self willAccessValueForKey:@"barcodeImage"];
    tmpValue = [self primitiveBarcodeImage];
    [self didAccessValueForKey:@"barcodeImage"];
    
    return tmpValue;
}

- (void)setBarcodeImage:(NSData *)value {
    [self willChangeValueForKey:@"barcodeImage"];
    [self setPrimitiveBarcodeImage:value];
    [self didChangeValueForKey:@"barcodeImage"];
}

- (BOOL)validateBarcodeImage:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSManagedObject *)order {
    id tmpObject;
    
    [self willAccessValueForKey:@"order"];
    tmpObject = [self primitiveOrder];
    [self didAccessValueForKey:@"order"];
    
    return tmpObject;
}

- (void)setOrder:(NSManagedObject *)value {
    [self willChangeValueForKey:@"order"];
    [self setPrimitiveOrder:value];
    [self didChangeValueForKey:@"order"];
}

- (BOOL)validateOrder:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

#endif

@end
