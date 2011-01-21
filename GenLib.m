#import "GenLib.h"

@implementation GenLib

// returns a string like
// 5:30 PM - 7:30 PM
// If an event doesn't end within 24 hours of the start, we add the end date to the end:
// 5:30 PM - May 21, 6:00 PM
+(NSString*) timeRangeStringFrom:(NSDate*)d1 to:(NSDate*)d2 {
	NSDateFormatter* timeFmt = [[[NSDateFormatter alloc] init] autorelease];
	[timeFmt setDateFormat:@"h:mm"];

	NSString* startAmPm = [self amPm:d1];
	NSString* endAmPm = [self amPm:d2];

	NSString* endDateStr = @"";
	if ([self needToShowEndDateWithStart:d1 end:d2]) {
		NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
		[dateFormatter setDateFormat:@"MMM d"];	
		endDateStr = [[dateFormatter stringFromDate:d2] stringByAppendingString:@", "];
	}
	
	return [NSString stringWithFormat:@"%@ %@ - %@%@ %@",
			[timeFmt stringFromDate:d1], startAmPm, 
			endDateStr, [timeFmt stringFromDate:d2], endAmPm];
}

+(NSString*) timeStringFrom:(NSDate*)d1 {
	NSDateFormatter * betterFmt = [[[NSDateFormatter alloc] init] autorelease];
    [betterFmt setTimeStyle:NSDateFormatterShortStyle];
    
    return [betterFmt stringFromDate:d1];
    
    /*NSDateFormatter* timeFmt = [[[NSDateFormatter alloc] init] autorelease];
	[timeFmt setDateFormat:@"h:mm"];
    
	NSString* startAmPm = [self amPm:d1];

	return [NSString stringWithFormat:@"%@ %@",
			[timeFmt stringFromDate:d1], startAmPm];
     */
}

+(BOOL) needToShowEndDateWithStart:(NSDate*)start end:(NSDate*)end {
	NSTimeInterval secsDiff = [end timeIntervalSinceDate:start];
	return (secsDiff >= (60 * 60 * 24));
}

+(NSDate*) oneMinuteAgo {
	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit | NSMinuteCalendarUnit | NSHourCalendarUnit | NSSecondCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSTimeZone* currentTimeZone = [NSTimeZone localTimeZone];
	[calendar setTimeZone:currentTimeZone];
	
	// Create reference date for supplied date.
	NSDateComponents *comps = [calendar components:unitFlags fromDate:[NSDate date]];
	//	NSLog(@"%d", [comps minute]);
	int minute = [comps minute] - 1;
	if (minute < 0) { minute = 0; }
	[comps setMinute:minute];
	NSDate *referenceDate = [calendar dateFromComponents:comps];
	return [referenceDate retain];
}

+(NSDate*) oneMinuteAhead:(NSDate*)date {
	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit | NSMinuteCalendarUnit | NSHourCalendarUnit | NSSecondCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSTimeZone* currentTimeZone = [NSTimeZone localTimeZone];
	[calendar setTimeZone:currentTimeZone];
	
	// Create reference date for supplied date.
	NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
	//	NSLog(@"%d", [comps minute]);
	int minute = [comps minute] + 1;
	if (minute < 0) { minute = 0; }
	[comps setMinute:minute];
	NSDate *referenceDate = [calendar dateFromComponents:comps];
	return [referenceDate retain];
}

+(NSString*) amPm:(NSDate*)d {
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar] autorelease];
	NSDateComponents* compHr = [cal components:NSHourCalendarUnit fromDate:d];
	return ([compHr hour] < 12 ? @"AM" : @"PM");
}

// e.g.,
// Aug 4, 2009  or
// Tuesday, Aug 4, 2009
+(NSString*) dateString:(NSDate*)d withWeekday:(BOOL)showWeekday {
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"MMM d, yyyy"];	
	NSString* datePart = [dateFormatter stringFromDate:d];
	if (showWeekday) {
		NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar] autorelease];
		NSDateComponents* startCompWkDay =[cal components:NSWeekdayCalendarUnit fromDate:d];		
		NSArray* weekdays = [NSArray arrayWithObjects:@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
		return [NSString stringWithFormat:@"%@, %@", [weekdays objectAtIndex:([startCompWkDay weekday] - 1)], datePart];		
	} else {
		return datePart;
	}
}

+(NSString*) dateToSQLiteFormat:(NSDate*)d {
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	
	//NSLog(@"dateToSQLiteFormat %@", d);
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString* strdate;
	if(d) {
		strdate = [dateFormatter stringFromDate:d];
	} else {
		strdate = @"0000-00-00 00:00:00";
	}
	[dateFormatter release];
	return strdate;
}

+(NSDate*) dateFromString:(NSString*)dateStr {
	NSDateFormatter* fmtr = [[[NSDateFormatter alloc] init] autorelease];
	[fmtr setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	return [fmtr dateFromString:dateStr];
}

+(NSString*) apiStringFromDate:(NSDate*)d {
	NSDateFormatter* fmtr = [[[NSDateFormatter alloc] init] autorelease];
	[fmtr setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	return [fmtr stringFromDate:d];
}

// e.g.,
// June 4, 2009
+(NSString*) fullSimpleDateString:(NSDate*)d {
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"MMMM d, yyyy"];
	return [dateFormatter stringFromDate:d];
}

// e.g.,
// 8/12/09 5:25 PM
+(NSString*) compactDateTimeString:(NSDate*)d includeDate:(BOOL)incDate {
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:[NSString stringWithFormat:@"%@h:mm ", (incDate ? @"M/d/yy " : @"")]];
	NSString* sansAmPm = [dateFormatter stringFromDate:d];
	return [sansAmPm stringByAppendingString:[self amPm:d]];
}

// e.g.,
// Sat May 20 12:00 PM
+(NSString*) editDispDateString:(NSDate*)d includeDate:(BOOL)incDate {
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:[NSString stringWithFormat:@"%@h:mm ", (incDate ? @" MMM d " : @"")]];
	NSString* sansAmPm = [dateFormatter stringFromDate:d];
	if (incDate) {
		NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar] autorelease];
		NSDateComponents* startCompWkDay =[cal components:NSWeekdayCalendarUnit fromDate:d];		
		NSArray* weekdays = [NSArray arrayWithObjects:@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", nil];
		sansAmPm = [[weekdays objectAtIndex:([startCompWkDay weekday] - 1)] stringByAppendingString:sansAmPm];
	}
	return [sansAmPm stringByAppendingString:[self amPm:d]];
}

@end
