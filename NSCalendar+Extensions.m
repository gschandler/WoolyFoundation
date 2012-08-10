//
//  NSCalendar+Extensions.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 4/16/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSCalendar+Extensions.h"

@implementation NSCalendar (WoolyFoundation)

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