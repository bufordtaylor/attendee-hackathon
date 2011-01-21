//
//  TicketDetailViewController.h
//  MyEvents
//
//  Created by Buford Taylor on 1/20/11.
//  Copyright 2011 Eventbrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"
#import "Order.h"
#import "Attendee.h"
#import "GenLib.h"
@class Order;
@class Attendee;

@interface TicketDetailViewController : UIViewController {
	IBOutlet UIImageView *preview;
	IBOutlet UITextField *dataToEncode;
	IBOutlet UITextField *license;	
	IBOutlet UITableView *barcodes;
	NSString* barcode;
	IBOutlet UILabel* displayName;
	IBOutlet UILabel* displayTicketClass;
	IBOutlet UILabel* displayEventName;
	IBOutlet UILabel* displayStartDate;
	Order* order;
	Attendee* attendee;
}

@property (nonatomic, retain) NSString* barcode;
@property (nonatomic, retain) Order* order;
@property (nonatomic, retain) Attendee* attendee;

- (void)refresh;

@end
