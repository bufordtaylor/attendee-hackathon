#import "IBTableViewCell.h"

@implementation IBTableViewCell

@synthesize cellView;

- (id)initWithCellNib:(NSString*)nibName reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {
		// XXX: do we have to do that thing where we set the identifier in the Xib to match the reuseidentifier?
		NSArray* tmp = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
		if (!tmp) {
			[NSException raise:@"Unable to load nib" format:@"named '%@'.", nibName];
		}
	}
	[self.contentView addSubview:self.cellView];
	return self;
}

-(void) dealloc {
	[cellView release];
    [super dealloc];
}

@end
