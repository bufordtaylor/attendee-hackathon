#import <Foundation/Foundation.h>
#import "IBTableViewCell.h"

@interface TextEditCell : IBTableViewCell {
	IBOutlet UILabel* fieldLabel;
	IBOutlet UITextField* field;
}

-(id) initWithReuseIdentifier:(NSString*)ri;
-(void) setupWithLabel:(NSString*)lbl placeholder:(NSString*)placeholder isSelected:(BOOL)yesNo;
-(void) setVal:(NSString*)v;
-(UITextField*) field;
-(BOOL) isEmptyText;

// UIAccessibility Informal Protocol methods
-(BOOL) isAccessibilityElement;
@property (nonatomic, copy) NSString * accessibilityLabel;
@property (nonatomic, copy) NSString * accessibilityValue;

@end
