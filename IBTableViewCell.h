#import <UIKit/UIKit.h>

/*
 A class for making it easier to create Interface Builder-based tables.
 
 Instructions:
 
 
 Notes:
 - Makes sure in the nib you link cellView outlet to the UIView in the nib!
 - If doing a grouped table cell, then set the background to clear in IB.
 
 */

@interface IBTableViewCell : UITableViewCell {
	UIView* cellView;
}

@property (nonatomic, retain) IBOutlet UIView* cellView;


- (id)initWithCellNib:(NSString*)nibName reuseIdentifier:(NSString *)reuseIdentifier;

@end
