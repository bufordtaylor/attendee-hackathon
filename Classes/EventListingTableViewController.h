//
//  EventListingTableViewController.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-11-27.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "State.h"
#import "MyEventsAppDelegate.h"
#import "Attendee.h"

@interface EventListingTableViewController : UITableViewController {
    NSArray * orders;
    int selectedIndex;
    NSManagedObjectContext * managedObjectContext;
    State * state;
}

@property (nonatomic, assign) NSManagedObjectContext * managedObjectContext;

@end