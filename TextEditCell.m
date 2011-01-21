#import "TextEditCell.h"

@implementation TextEditCell

-(id) initWithReuseIdentifier:(NSString*)ri {
	if ((self = [super initWithCellNib:@"TextEditCell" reuseIdentifier:ri])) {
		
	}
	return self;
}

-(void) dealloc {
	[fieldLabel release];
	[field release];
	[super dealloc];
}

-(UITextField*) field {
	return field;
}
	
-(void) setupWithLabel:(NSString*)lbl placeholder:(NSString*)placeholder isSelected:(BOOL)yesNo {
	fieldLabel.text = lbl;
	field.placeholder = placeholder;
	if (yesNo) { [field becomeFirstResponder]; }
}

-(void) setVal:(NSString*)v {
	field.text = v;
}

-(BOOL) isEmptyText {
	NSString* t = field.text;
	return (!t || ([[t stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0));
}


// UIAccessibility informal protocol methods

-(BOOL) isAccessibilityElement {
    return true;
}

-(void) setAccessibilityLabel:(NSString *)accessibilityLabel {
    fieldLabel.text = accessibilityLabel;
}

-(NSString *) accessibilityLabel {
    return fieldLabel.text;
}

-(void) setAccessibilityValue:(NSString *)accessibilityValue {
    field.text = accessibilityValue;
}
-(NSString *) accessibilityValue {
    return field.text;
}

@end
