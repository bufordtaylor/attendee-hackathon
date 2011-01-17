//
//  State.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Attendee.h"

@interface State : NSManagedObject {
@private
}
@property (nonatomic, retain) Attendee * currentAttendee;

@end
