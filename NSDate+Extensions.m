//
//  NSDate+Extensions.m
//  WBUtilities
//
//  Created by Scott Chandler on 1/12/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (WoolyBeast)
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
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.day = days;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:today options:0];
	[offset release];
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
		NSDateComponents *offset = [[NSDateComponents alloc] init];
		offset.day = 1;
		offset.second = -1;
		NSDate *endOfDay = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:startOfDay options:0];
		[offset release];
		today &= [self earlierDate:endOfDay] == self;
	}
	return today;
	
}

- (NSDate *)hourLater
{
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.hour = 1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
	return date;
}

- (NSDate *)hourEarlier
{
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.hour = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
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
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.day = 1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
	return date;
}

- (NSDate *)dayEarlier
{
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.day = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
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
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.week = 1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
	return date;
}

- (NSDate *)weekEarlier
{
	NSDateComponents *offset = [[NSDateComponents alloc] init];
	offset.week = -1;
	NSDate *date = [[NSCalendar autoupdatingCurrentCalendar] dateByAddingComponents:offset toDate:self options:0];
	[offset release];
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

@end
