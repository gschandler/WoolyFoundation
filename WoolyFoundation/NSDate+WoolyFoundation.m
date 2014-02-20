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
@interface NSDate(WoolyFoundationExtras)
- (NSDate *)integralDate;
@end


@implementation NSDate (WoolyFoundation)
+(NSDate *)yesterday
{
	NSDate *yesterday = [[NSDate today] dayEarlier];
	return yesterday;
}

+(NSDate *)today
{
	return [[NSDate date] startOfDay];
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
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:today options:0];
	WBRelease(offset);
	return date;
}

-(BOOL)isYesterday
{
	return [self isSameDayAsDate:[NSDate yesterday]];
}

-(BOOL)isBeforeToday
{
	return [self isBeforeDay:[NSDate today]];
}

-(BOOL)isToday
{
	return [self isSameDayAsDate:[NSDate today]];
}

- (BOOL)isAfterToday
{
	return [self isAfterDay:[NSDate today]];
}

-(BOOL)isTomorrow
{
	return [self isSameDayAsDate:[NSDate tomorrow]];
}

-(BOOL)isSameDayAsDate:(NSDate *)date
{
	if ( date == nil ) return NO;
	
	NSCalendarUnit units = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
	NSDateComponents *components = [[NSCalendar currentCalendar] components:units
																   fromDate:[self startOfDay]
																	 toDate:[date startOfDay]
																	options:0];
	return components.month==0 && components.day==0 && components.year==0;
}

- (NSDate *)hourLater
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = 1;
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)hourEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = -1;
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisHour
{
	NSCalendarUnit units = NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:self];
	[components setMinute:-[components minute]];
	[components setSecond:-[components second]];
	return [[NSCalendar currentCalendar] dateByAddingComponents:units toDate:self options:0];
	
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
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)dayEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = -1;
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisDay
{
	return [self startOfDay];
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
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)weekEarlier
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = -1;
	NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:self options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisWeek
{
	NSCalendarUnit units = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit;
	NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:self];
	[components setSecond:-[components second]];
	[components setMinute:-[components minute]];
	[components setHour:-[components hour]];
	[components setDay:-[components day]];
	return [[NSCalendar currentCalendar] dateByAddingComponents:units toDate:self options:0];
	
}

- (NSDate *)previousWeek
{
	return [[self thisWeek] weekEarlier];
}

- (NSDate *)nextWeek
{
	return [[self thisWeek] weekLater];
}

- (NSDate *)startOfDay
{
	NSDate *date = [self integralDate];
	NSCalendarUnit units = NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:date];
	if ( components.hour > 0 || components.minute > 0 || components.second > 0 ) {
		// roll backward
		[components setHour:-[components hour]];
		[components setMinute:-[components minute]];
		[components setSecond:-[components second]];
		date = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	}
	return date;
}

- (NSDate *)endOfDay
{
	NSDate *date = [self integralDate];
	NSCalendarUnit units = NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [[NSCalendar currentCalendar] components:units fromDate:date];
	// roll forward to beginning of next day
	[components setHour:-[components hour]];
	[components setMinute:-[components minute]];
	[components setSecond:-[components second]-1];
	[components setDay:1];
	date = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:self options:0];
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

- (BOOL)isBeforeDay:(NSDate *)date
{
	return [self isBeforeDate:[date startOfDay]];
}

- (BOOL)isAfterDay:(NSDate *)date
{
	return [self isAfterDate:[date endOfDay]];
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

@implementation NSDate(WoolyFoundationExtras)

- (NSDate *)integralDate
{
	NSTimeInterval seconds = [self timeIntervalSinceReferenceDate];
	NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:trunc(seconds)];
	return date;
}

@end