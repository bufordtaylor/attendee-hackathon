//
//  MyEventsXMLParser.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "State.h"
#import "Order.h"
#import "Ticket.h"
#import "Attendee.h"


@interface MyEventsXMLParser : NSObject<NSXMLParserDelegate> {
    Attendee * currentAttendee;
    Order * currentOrder;
    Ticket * currentTicket;
    NSArray * ids;
    NSManagedObjectContext * context;
    BOOL inOrder, inTicket, inTicketType, inVenue, ignoreOrder;
    NSString * currentTag;
    NSString * currentChars;
}

- (NSArray *) existingOrderIDs;

@end
