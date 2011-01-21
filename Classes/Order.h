//
//  Order.h
//  MyEvents
//
//  Created by Kiel Oleson on 2011-01-19.
//  Copyright (c) 2011 Eventbrite. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "State.h"

@interface Order : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSString * venueName;
@property (nonatomic, retain) NSString * eventName;
@property (nonatomic, retain) Attendee * attendee;
@property (nonatomic, retain) State * referencingState;
@property (nonatomic, retain) NSSet* tickets;

@end
