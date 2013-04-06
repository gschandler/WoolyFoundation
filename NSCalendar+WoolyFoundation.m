//
//  NSCalendar+WoolyFoundation.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 4/16/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
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