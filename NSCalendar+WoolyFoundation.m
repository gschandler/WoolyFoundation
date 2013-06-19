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