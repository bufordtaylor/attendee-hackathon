//
//  FlipsideViewController.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-11-27.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventListingTableViewController.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
    IBOutlet EventListingTableViewController * tableViewController;
}

@property (nonatomic, retain) IBOutlet EventListingTableViewController * tableViewController;

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end
