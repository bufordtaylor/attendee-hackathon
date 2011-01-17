//
//  Attendee.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright (c) 2010 Eventbrite. All rights reserved.
//

#import <CoreData/CoreData.h>
@class State;

@interface Attendee : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * passwordToken;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSSet* orders;
@property (nonatomic, retain) State * referencingState;

@end
