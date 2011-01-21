/**
 Static general functions relating to times and dates
 */

#import <Foundation/Foundation.h>

@interface GenLib : NSObject {

}

+(NSString*) timeRangeStringFrom:(NSDate*)d1 to:(NSDate*)d2;
+(NSString*) timeStringFrom:(NSDate*)d1;
+(NSString*) dateString:(NSDate*)d withWeekday:(BOOL)showWeekday;
+(NSString*) fullSimpleDateString:(NSDate*)d;
+(NSDate*) dateFromString:(NSString*)dateStr;
+(NSString*) compactDateTimeString:(NSDate*)d includeDate:(BOOL)incDate;
+(NSString*) amPm:(NSDate*)d;
+(BOOL) needToShowEndDateWithStart:(NSDate*)start end:(NSDate*)end;
+(NSString*) apiStringFromDate:(NSDate*)d;
+(NSString*) editDispDateString:(NSDate*)d includeDate:(BOOL)incDate;
+(NSString*) dateToSQLiteFormat:(NSDate*)d;
+(NSDate*) oneMinuteAgo;
+(NSDate*) oneMinuteAhead:(NSDate*)date;

@end
