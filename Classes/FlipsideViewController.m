//
//  FlipsideViewController.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-11-27.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate, tableViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];    
	tableViewController.parentVC = self;
	if (!logoutButton) {
		logoutButton = [[UIBarButtonItem alloc] initWithTitle: @"Log Out" style:UIBarButtonItemStyleBordered target:self action:@selector(done:)];
	}


	UIToolbar *toolbar;
	
	toolbar = [UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	[toolbar sizeToFit];
	toolbar.frame = CGRectMake(0, 0, 320, 50);
	
	
	toolbar.tintColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
	
	
	
	
	UILabel *label;
	label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 230, 20)];
	NSMutableString* str = [NSMutableString stringWithFormat:@"My Tickets"];
	label.text = str;
//	UIButton * infoDarkButtonType = [[[UIButton buttonWithType:UIButtonTypeCustom] retain] autorelease];
//	[infoDarkButtonType setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
//	infoDarkButtonType.frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
//	infoDarkButtonType.backgroundColor = [UIColor clearColor];
//	[infoDarkButtonType addTarget:self action:@selector(infoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//	infoButton = [[UIBarButtonItem alloc] initWithCustomView:infoDarkButtonType];
//	infoDarkButtonType.accessibilityLabel = @"Close Info Button";
	
	label.font = [UIFont boldSystemFontOfSize:20.0];
	label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
	label.textAlignment = UITextAlignmentCenter;
	
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	
	
	UIBarButtonItem* infoLabel = [[UIBarButtonItem alloc] initWithCustomView:label];
	
	NSArray *items = [NSArray arrayWithObjects: infoLabel, logoutButton, nil];

	[toolbar setItems:items animated:NO];
	
	[self.view addSubview:toolbar];
}


- (void) finished {
	[tableViewController dismissModalViewControllerAnimated:YES];	
	logoutButton = [[UIBarButtonItem alloc] initWithTitle: @"Log Out" style:UIBarButtonItemStyleBordered target:self action:@selector(done:)];
	[self viewDidLoad];
}

-(void) presentFinishedButton {
	logoutButton = [[UIBarButtonItem alloc] initWithTitle: @"Finished" style:UIBarButtonItemStyleBordered target:self action:@selector(finished)];
	[self viewDidLoad];
}

- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
