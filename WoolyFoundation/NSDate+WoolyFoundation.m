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

@implementation NSDate (WoolyFoundation)
+(NSDate *)yesterday
{
	NSDate *yesterday = [[NSDate today] dayEarlier];
	return yesterday;
}

+(NSDate *)today
{
	NSCalendar *currentCalendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *components = [currentCalendar components:NSYearCalendarUnit+NSMonthCalendarUnit+NSDayCalendarUnit fromDate:[NSDate date]];
	NSDate *today = [currentCalendar dateFromComponents:components];
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
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:today options:0];
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
	
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *components = [calendar components:NSYearCalendarUnit+NSMonthCalendarUnit+NSDayCalendarUnit fromDate:date];
	NSDate *startOfDay = [calendar dateFromComponents:components];
	BOOL today = [self laterDate:startOfDay] == self;
	if ( today ) {
		NSDateComponents *offset = [NSDateComponents new];
		offset.day = 1;
		offset.second = -1;
		NSDate *endOfDay = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:startOfDay options:0];
#if !__has_feature(objc_arc)
		[offset release];
#endif
		today &= [self earlierDate:endOfDay] == self;
	}
	return today;
	
}

- (NSDate *)hourLater
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = 1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)hourEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisHour
{
	NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSHourCalendarUnit+NSDayCalendarUnit+NSMonthCalendarUnit+NSYearCalendarUnit+NSEraCalendarUnit fromDate:self];
	return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
	
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
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)dayEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisDay
{
	NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSDayCalendarUnit+NSMonthCalendarUnit+NSYearCalendarUnit+NSEraCalendarUnit fromDate:self];
	return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
	
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
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)weekEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
#if !__has_feature(objc_arc)
	[offset release];
#endif
	return date;
}

- (NSDate *)thisWeek
{
	NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSMonthCalendarUnit+NSYearCalendarUnit+NSEraCalendarUnit fromDate:self];
	return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
	
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
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *components = [calendar components:NSEraCalendarUnit+NSYearCalendarUnit+NSMonthCalendarUnit+NSDayCalendarUnit fromDate:self];
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	NSDate *date = [calendar dateFromComponents:components];
	return date;
}

- (NSDate *)endOfDay
{
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *components = [calendar components:NSEraCalendarUnit+NSYearCalendarUnit+NSMonthCalendarUnit+NSDayCalendarUnit fromDate:self];
	[components setHour:11];
	[components setMinute:59];
	[components setSecond:59];
	NSDate *date = [calendar dateFromComponents:components];
	return date;
}


- (BOOL)isBeforeDate:(NSDate *)date
{
	NSDate *result = [self laterDate:date];
	return result == date;
}

- (BOOL)isAfterDate:(NSDate *)date
{
	NSDate *result = [self earlierDate:date];
	return result == date;
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
