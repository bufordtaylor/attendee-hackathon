//
//  MyEventsXMLParser.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-12-24.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import "MyEventsXMLParser.h"
#import "MyEventsAppDelegate.h"

@implementation MyEventsXMLParser

-(id) init {
    [super init];
    
    // get NSManagedObjectContext.
    context = ((MyEventsAppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    currentAttendee = ((MyEventsAppDelegate *)[[UIApplication sharedApplication] delegate]).state.currentAttendee;
    NSLog(@"MyEventsXMLParser: init: currentAttendee is %p", currentAttendee);
    inOrder = NO;
    inVenue = NO;
    inTicket = NO;
    inTicketType = NO;
    ignoreOrder = NO;
    
    
    // grab array of all IDs.
    ids = [self existingOrderIDs];
    
    
    currentTag = @"";
    return self;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"MyEventsXMLParser: parserDidStartDocument");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"MyEventsXMLParser: parserDidEndDocument");
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"MyEventsXMLParser: parser:didStartElement: with name %@", elementName);
    currentChars = nil;
    currentTag = elementName;
    ignoreOrder = NO;
    // potential leak-o-matic?  kmo 24 dec 2010 14h04
    [currentTag retain];
    if (inOrder) {
        if (inTicket) {
            if ([elementName isEqualToString:@"type"]) {
                inTicketType = YES;
            }
        }
        if ([elementName isEqualToString:@"ticket"]) {
            currentTicket = (Ticket *)[NSEntityDescription insertNewObjectForEntityForName:@"Ticket" inManagedObjectContext:context];
            inTicket = YES;
        }
    }
    else if ([elementName isEqualToString:@"order"]) {
        currentOrder = (Order *)[NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:context];
        inOrder = YES;
    }
    else {
        NSLog(@"oh noes uncovered case");
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (currentChars == nil) {
        currentChars = [NSString stringWithString:string];
    }
    else {
        currentChars = [NSString stringWithFormat:@"%@%@",currentChars,string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"MyEventsXMLParser: parser:didEndElement: with name %@", elementName);
    if (inTicketType) {
        if ([elementName isEqualToString:@"name"]) {
            currentTicket.typeName = currentChars;
        }
        else if ([elementName isEqualToString:@"type"]) {
            NSLog(@"done with ticket type.");
            inTicketType = NO;
        }
    }
    else if (inTicket) {
        if ([elementName isEqualToString:@"ticket"]) {
            NSLog(@"done with ticket.");
            inTicket = NO;
            NSMutableSet * newTickets = [NSMutableSet setWithSet:currentOrder.tickets];
            [newTickets unionSet:[NSSet setWithObject:currentTicket]];
            currentOrder.tickets = [NSSet setWithSet:newTickets];
            //[currentOrder addTicketsObject:currentTicket];
            currentTicket = nil;
        }
        else if ([elementName isEqualToString:@"barcode"]) {
            currentTicket.barcodeNumber = currentChars;
        }
    }
    else if ([elementName isEqualToString:@"order"]) {
        NSLog(@"done with order.");
        inOrder = NO;
        ignoreOrder = NO;
        NSMutableSet * newOrders = [NSMutableSet setWithSet:currentAttendee.orders];
        [newOrders unionSet:[NSSet setWithObject:currentOrder]];
        currentAttendee.orders = [NSSet setWithSet:newOrders];
        currentOrder = nil;
    }
    else if (inOrder) {
        if (ignoreOrder) {
            return;
        }
        
        else if ([elementName isEqualToString:@"eventName"]) {
            currentOrder.eventName = currentChars;
        }
        else if ([elementName isEqualToString:@"id"]) {
            currentOrder.id = currentChars;
            //BOOL alreadyHaveThisOrder = NO;
            for (NSString * currentOID in ids) {
                if ([currentOID isEqualToString:currentChars]) {
                    ignoreOrder = YES;
                }
            }
            
            //[context deleteObject:currentOrder];
            //currentOrder = nil;
        }else if ([elementName isEqualToString:@"venueId"]) {
            // do nothing.
        }
    }
    currentChars = nil;
}


- (NSArray *) existingOrderIDs {
    NSEntityDescription * ordersEntity = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:context];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:ordersEntity];
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptor release];
    
    // FIXME:  just getting all of the events for now.
    //NSPredicate * predicate = [NSPredicate predicateWithFormat:"venueForEvent
    
    NSError * error = nil;
    NSArray * results = [context executeFetchRequest:request error:&error];
    NSMutableArray * tempIDs = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (Order * order in results) {
        if (order.id != nil) {
            [tempIDs addObject:order.id];
        }
    }
    
    NSLog(@"found %d existing order IDs", [ids count]);
    //[results release];
    
    [request release];

    return tempIDs;
}


@end
