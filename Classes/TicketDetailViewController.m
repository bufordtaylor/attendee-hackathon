//
//  TicketDetailViewController.m
//  MyEvents
//
//  Created by Buford Taylor on 1/20/11.
//  Copyright 2011 Eventbrite. All rights reserved.
//

#import "TicketDetailViewController.h"
#import "WSSI.h"

NSString *symbologies[] =
{
	@"Code EAN 8",
	@"Code EAN 13",
	@"Code ISBN 10",
	@"Code ISBN 13",
	@"Code UPC-A",
	@"Code UPC-E",
	@"Code 128",
	@"Code 128 GS1",
	@"Code 2/5 Interleaved",
	@"Code 2/5 Industrial",
	@"Code 39",
	@"PZN PharmaCode",
	@"Laetus PharmaCode",
	@"Codabar",
	@"Datamatrix (2D)",
	@"PDF417 (2D)",
	@"QR (Quick Response) Code (2D)",
	@"GS1 Databar"
};

@implementation TicketDetailViewController

@synthesize barcode, order, attendee;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)setup {
	if ([order.tickets count] == 1) {
		Ticket* t = [[order.tickets allObjects] objectAtIndex:0];
		barcode = t.barcodeNumber;
		[displayTicketClass setText:t.typeName];
		[displayEventName setText:order.eventName];
		[displayStartDate setText:[GenLib editDispDateString:order.startDate includeDate:YES]];
		[displayName setText:[NSString stringWithFormat:@"%@ %@", attendee.firstName, attendee.lastName]];
		[self.view bringSubviewToFront:displayName];
	} else {
		NSLog(@"Multi barcodes not implimented yet");
	}
}

-(void)viewDidLoad {
	[self setup];
    WSSI_Init();
	WSSI_SetModuleWidth(1.0f);
	
	NSString *data = [NSString stringWithCString:WSSI_GetDataToEncode() encoding:NSASCIIStringEncoding];
	[dataToEncode setText:data];
	
	NSString *lic = [NSString stringWithCString:WSSI_GetLicense() encoding:NSASCIIStringEncoding];
	[license setText:lic];
	
//	[barcodes reloadData];
//	NSIndexPath *ip = [NSIndexPath indexPathForRow:CODE_DATAMATRIX - 1000 inSection:0];
//	[barcodes selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionTop];
	
	[self refresh];
	
	[dataToEncode setKeyboardAppearance:UIKeyboardAppearanceAlert];
	
    [super viewDidLoad];		
}

- (void)refresh {
	// Change dpi parameter for WSSI_GetCode() to match the resolution of the actual device. 
	// For an iPhone 4 this would be 326 dpi.
	// For barcodes that are supposed to be emailed or sent somewhere else, 300 or 600 will usually
	// be ok.
	
	char buffer[512];
	[barcode getCString:buffer maxLength:511 encoding:NSASCIIStringEncoding];
	WSSI_SetDataToEncode(buffer);
	
	NSIndexPath *ip = [NSIndexPath indexPathForRow:CODE_DATAMATRIX - 1000 inSection:0];
	WSSI_SetCodeType([ip row] + 1000);
	CGImageRef img = WSSI_GetCode(326);
	
	// Will return nil if a code could not be created, usually
	// because of inappropriate data for the selected code type.
	// See manual for a list of expected data.
	
	if(img != nil)
	{
		UIImage *uiimg = [UIImage imageWithCGImage:img];
		[preview setImage:uiimg];
		CGImageRelease(img);
	}
	else
	{
		[preview setImage:[UIImage imageNamed:@"error.png"]];
	}
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
