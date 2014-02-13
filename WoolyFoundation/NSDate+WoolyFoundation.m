//
//  NSDate+WoolyFoundation.m
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013 Wooly Beast Software
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "NSDate+WoolyFoundation.h"

@interface WFCalendarManager : NSObject
@property (strong,readonly) NSCalendar *calendar;
+ (WFCalendarManager *)calendarManager;
+ (NSCalendar *)calendar;
- (void)systemTimeZoneChangeNotification:(NSNotification *)notification;
@end


@implementation NSDate (WoolyFoundation)
+(NSDate *)yesterday
{
	NSDate *yesterday = [[NSDate today] dayEarlier];
	return yesterday;
}

+(NSDate *)today
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
	NSDate *today = [[WFCalendarManager calendar] dateFromComponents:components];
	return today;
}

+(NSDate *)tomorrow
{
	NSDate *tomorrow = [[NSDate today] dayLater];
	return tomorrow;
}

+(NSDate *)dateDaysFromToday:(NSInteger)days
{
	NSDate *today = [NSDate today];
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = days;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:today options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

-(BOOL)isYesterday
{
	return [self isSameDayAsDate:[NSDate yesterday]];
}

-(BOOL)isBeforeToday
{
	NSDate *today = [NSDate today];
	return [self compare:today] == NSOrderedAscending;
}

-(BOOL)isToday
{
	return [self isSameDayAsDate:[NSDate today]];
}

- (BOOL)isAfterToday
{
	NSDate *tomorrow = [NSDate tomorrow];
	return [self compare:tomorrow] != NSOrderedAscending;
}

-(BOOL)isTomorrow
{
	return [self isSameDayAsDate:[NSDate tomorrow]];
}

-(BOOL)isSameDayAsDate:(NSDate *)date
{
	if ( date == nil ) return NO;
	
	NSCalendarUnit units = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
	NSDateComponents *components = [[WFCalendarManager calendar] components:units fromDate:[self beginningOfDay] toDate:[date beginningOfDay] options:0];
	return components.month==0 && components.day==0 && components.year==0;
}

- (NSDate *)hourLater
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = 1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)hourEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = -1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisHour
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSHourCalendarUnit|NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSEraCalendarUnit fromDate:self];
	return [[WFCalendarManager calendar] dateFromComponents:components];
	
}

- (NSDate *)previousHour
{
	return [[self thisHour] hourEarlier];
}

- (NSDate *)nextHour
{
	return [[self thisHour] hourLater];
}

- (NSDate *)dayLater
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = 1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)dayEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = -1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisDay
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSEraCalendarUnit fromDate:self];
	return [[WFCalendarManager calendar] dateFromComponents:components];
	
}

- (NSDate *)previousDay
{
	return [[self thisDay] dayEarlier];
}

- (NSDate *)nextDay
{
	return [[self thisDay] dayLater];
}

- (NSDate *)weekLater
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = 1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)weekEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = -1;
	NSDate *date = [[WFCalendarManager calendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisWeek
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSMonthCalendarUnit+NSYearCalendarUnit+NSEraCalendarUnit fromDate:self];
	return [[WFCalendarManager calendar] dateFromComponents:components];
	
}

- (NSDate *)previousWeek
{
	return [[self thisWeek] weekEarlier];
}

- (NSDate *)nextWeek
{
	return [[self thisWeek] weekLater];
}

- (NSDate *)beginningOfDay
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	NSDate *date = [[WFCalendarManager calendar] dateFromComponents:components];
	return date;
}

- (NSDate *)endOfDay
{
	NSDateComponents *components = [[WFCalendarManager calendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
	[components setHour:11];
	[components setMinute:59];
	[components setSecond:59];
	NSDate *date = [[WFCalendarManager calendar] dateFromComponents:components];
	return date;
}


- (BOOL)isBeforeDate:(NSDate *)date
{
	NSDate *result = [date earlierDate:self];
	return result != date;
}

- (BOOL)isAfterDate:(NSDate *)date
{
	NSDate *result = [date laterDate:self];
	return result != date;
}

- (BOOL)isBeforeNow
{
	return [self isBeforeDate:[NSDate date]];
}

- (BOOL)isAfterNow
{
	return [self isAfterDate:[NSDate date]];
}

- (BOOL)isInFuture
{
	return [self isAfterNow];
}

- (BOOL)isInPast
{
	return [self isBeforeNow];
}

@end


#pragma mark -

@implementation WFCalendarManager
@synthesize calendar=_calendar;

+ (WFCalendarManager *)calendarManager
{
	static WFCalendarManager *calenderManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		calenderManager = [WFCalendarManager new];
	});
	return calenderManager;
}

+ (NSCalendar *)calendar
{
	return [[WFCalendarManager calendarManager] calendar];
}

- (void)systemTimeZoneChangeNotification:(NSNotification *)notification
{
	[_calendar setTimeZone:[NSTimeZone systemTimeZone]];
}

- (id)init
{
	if ( self = [super init], self != nil ) {
		_calendar = [NSCalendar autoupdatingCurrentCalendar];
		[_calendar setTimeZone:[NSTimeZone systemTimeZone]];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(systemTimeZoneChangeNotification:)
													 name:NSSystemTimeZoneDidChangeNotification
												   object:nil];
	}
	return self;
}
@end