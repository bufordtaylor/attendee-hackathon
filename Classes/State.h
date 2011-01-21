//
//  State.h
//  MyEvents
//
//  Created by Kiel Oleson on 2011-01-19.
//  Copyright (c) 2011 Eventbrite. All rights reserved.
//

#import <CoreData/CoreData.h>
@class Attendee, Order;

@interface State : NSManagedObject {
@private
}
@property (nonatomic, retain) Attendee * currentAttendee;
@property (nonatomic, retain) Order * currentOrder;

@end
