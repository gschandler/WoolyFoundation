//
//  NSCalendar+WoolyFoundation.m
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

#import "NSCalendar+WoolyFoundation.h"
#import "NSDate+WoolyFoundation.h"
#import "WoolyMemory.h"

@implementation NSCalendar (WoolyFoundation)
- (NSDate *)dateByReplacingComponents:(NSDateComponents *)comps forCalendarUnits:(NSCalendarUnit)units toDate:(NSDate *)date
{
	NSParameterAssert(comps);
	NSParameterAssert(units);
	NSParameterAssert(date);
	
	NSDateComponents *dateComponents = [self components:units fromDate:date];
	if ( units & NSYearCalendarUnit ) {
		[dateComponents setYear:[comps year]-[dateComponents year]];
	}
	if ( units & NSMonthCalendarUnit ) {
		[dateComponents setMonth:[comps month]-[dateComponents month]];
	}
	if ( units & NSDayCalendarUnit ) {
		[dateComponents setDay:[comps day]-[dateComponents day]];
	}
	if ( units & NSHourCalendarUnit ) {
		[dateComponents setHour:[comps hour]-[dateComponents hour]];
	}
	if ( units & NSMinuteCalendarUnit ) {
		[dateComponents setMinute:[comps minute]-[dateComponents minute]];
	}
	if ( units & NSSecondCalendarUnit ) {
		[dateComponents setSecond:[comps second]-[dateComponents second]];
	}
	
	NSDate *newDate = [self dateByAddingComponents:dateComponents toDate:date options:0];
	return newDate;
}

- (NSDate *)yesterday
{
	NSDate *yesterday = [self dayEarlierThanDate:[self today]];
	return yesterday;
}

- (NSDate *)today
{
	return [self startOfDayFromDate:[NSDate date]];
}

- (NSDate *)tomorrow
{
	NSDate *tomorrow = [self dayLaterThanDate:[self today]];
	return tomorrow;
}

- (NSDate *)dateDaysFromToday:(NSInteger)days
{
	NSDate *today = [self today];
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = days;
	NSDate *date = [self dateByAddingComponents:offset toDate:today options:0];
	WBRelease(offset);
	return date;
}

-(BOOL)dateIsYesterday:(NSDate *)date
{
	return [self date:date isSameDayAsDate:[self yesterday]];
}

-(BOOL)dateIsBeforeToday:(NSDate *)date
{
	return [self date:date isBeforeDay:[self today]];
}

-(BOOL)dateIsToday:(NSDate *)date
{
	return [self date:date isSameDayAsDate:[self today]];
}

- (BOOL)dateIsAfterToday:(NSDate *)date
{
	return [self date:date isAfterDay:[self today]];
}

-(BOOL)dateIsTomorrow:(NSDate *)date
{
	return [self date:date isSameDayAsDate:[self tomorrow]];
}

- (BOOL)date:(NSDate *)date isSameDayAsDate:(NSDate *)other
{
	if ( date == nil || other == nil ) return NO;
	
	NSCalendarUnit units = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
	NSDateComponents *components = [self components:units
										   fromDate:[self startOfDayFromDate:date]
											 toDate:[self startOfDayFromDate:other]
											options:0];
	return components.month==0 && components.day==0 && components.year==0;
}

- (NSDate *)hourLaterThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = 1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)hourEarlierThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.hour = -1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisHourFromDate:(NSDate *)date
{
	NSCalendarUnit units = NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [self components:units fromDate:date];
	[components setMinute:-[components minute]];
	[components setSecond:-[components second]];
	return [self dateByAddingComponents:units toDate:date options:0];
	
}

- (NSDate *)previousHourFromDate:(NSDate *)date
{
	return [self hourEarlierThanDate:[self thisHourFromDate:date]];
}

- (NSDate *)nextHourFromDate:(NSDate *)date
{
	return [self hourLaterThanDate:[self thisHourFromDate:date]];
}

- (NSDate *)dayLaterThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = 1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)dayEarlierThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.day = -1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisDayFromDate:(NSDate *)date
{
	return [self startOfDayFromDate:date];
}

- (NSDate *)previousDayFromDate:(NSDate *)date
{
	return [self dayEarlierThanDate:[self thisDayFromDate:date]];
}

- (NSDate *)nextDayFromDate:(NSDate *)date
{
	return [self dayLaterThanDate:[self thisDayFromDate:date]];
}

- (NSDate *)weekLaterThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = 1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)weekEarlierThanDate:(NSDate *)date
{
	NSDateComponents *offset = [NSDateComponents new];
	offset.week = -1;
	date = [self dateByAddingComponents:offset toDate:date options:0];
	WBRelease(offset);
	return date;
}

- (NSDate *)thisWeekFromDate:(NSDate *)date
{
	NSCalendarUnit units = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit;
	NSDateComponents *components = [self components:units fromDate:date];
	[components setSecond:-[components second]];
	[components setMinute:-[components minute]];
	[components setHour:-[components hour]];
	[components setDay:-[components day]];
	return [self dateByAddingComponents:units toDate:date options:0];
	
}

- (NSDate *)previousWeekFromDate:(NSDate *)date
{
	return [self weekEarlierThanDate:[self thisWeekFromDate:date]];
}

- (NSDate *)nextWeekFromDate:(NSDate *)date
{
	return [self weekLaterThanDate:[self thisWeekFromDate:date]];
}

- (NSDate *)startOfDayFromDate:(NSDate *)date
{
	date = [date integralDate];
	NSCalendarUnit units = NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [self components:units fromDate:date];
	if ( components.hour > 0 || components.minute > 0 || components.second > 0 ) {
		// roll backward
		[components setHour:-[components hour]];
		[components setMinute:-[components minute]];
		[components setSecond:-[components second]];
		date = [self dateByAddingComponents:components toDate:date options:0];
	}
	return date;
}

- (NSDate *)endOfDayFromDate:(NSDate *)date
{
	date = [date integralDate];
	NSCalendarUnit units = NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
	NSDateComponents *components = [self components:units fromDate:date];
	// roll forward to beginning of next day
	[components setHour:-[components hour]];
	[components setMinute:-[components minute]];
	[components setSecond:-[components second]-1];
	[components setDay:1];
	date = [self dateByAddingComponents:components toDate:date options:0];
	return date;
}

- (BOOL)date:(NSDate *)date isBeforeDay:(NSDate *)other
{
	return [date isBeforeDate:[self startOfDayFromDate:other]];
}

- (BOOL)date:(NSDate *)date isAfterDay:(NSDate *)other
{
	return [date isAfterDate:[self endOfDayFromDate:other]];
}

@end


@implementation NSDateComponents (WoolyFoundation)

- (void)setValue:(NSInteger)value forCalendarUnit:(NSCalendarUnit)unit
{
	NSParameterAssert(unit&(NSSecondCalendarUnit+NSMinuteCalendarUnit+NSHourCalendarUnit+NSDayCalendarUnit+NSMonthCalendarUnit+NSYearCalendarUnit));

	if ( NSSecondCalendarUnit & unit ) {
		[self setSecond:value];
	}
	if ( NSMinuteCalendarUnit & unit ) {
		[self setMinute:value];
	}
	if ( NSHourCalendarUnit & unit ) {
		[self setHour:value];
	}
	if ( NSDayCalendarUnit & unit ) {
		[self setDay:value];
	}
	if ( NSMonthCalendarUnit & unit ) {
		[self setMonth:value];
	}
	if ( NSYearCalendarUnit & unit ) {
		[self setYear:value];
	}
}

@end