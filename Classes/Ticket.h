//
//  Ticket.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Ticket : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * barcodeNumber;
@property (nonatomic, retain) NSString * typeName;
@property (nonatomic, retain) NSData * barcodeImage;
@property (nonatomic, retain) NSManagedObject * order;

@end
