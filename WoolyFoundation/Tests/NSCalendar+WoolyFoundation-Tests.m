//
//  NSDate+WoolyFoundation-Tests.m
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

#import <XCTest/XCTest.h>
#import "NSCalendar+WoolyFoundation.h"

@interface NSCalendar_WoolyFoundation_Tests : XCTestCase
{
}
@property (nonatomic,strong) NSCalendar *testCalendar;
@end


@implementation NSCalendar_WoolyFoundation_Tests

- (void)setUp
{
	self.testCalendar = [NSCalendar currentCalendar];
}

- (void)tearDown
{
	
}

//- (NSDate *)dateDaysFromToday:(NSInteger)days;
- (void)test_dateDaysFromToday
{
	
}

//- (NSDate *)hourLaterThanDate:(NSDate *)date;
- (void)test_hourLaterThanDate
{
	
}

//- (NSDate *)hourEarlierThanDate:(NSDate *)date;
- (void)test_hourEarlierThanDate
{
	
}

//- (NSDate *)thisHourFromDate:(NSDate *)date;		// start of hour
- (void)test_thisHourFromDate
{
	
}

//- (NSDate *)previousHourFromDate:(NSDate *)date;
- (void)test_previousHourFromDate
{
	
}

//- (NSDate *)nextHourFromDate:(NSDate *)date;
- (void)test_nextHourFromDate
{
	
}

//- (NSDate *)dayLaterThanDate:(NSDate *)date;
- (void)test_dayLaterThanDate
{
	
}

//- (NSDate *)dayEarlierThanDate:(NSDate *)date;
- (void)test_dayEarlierThanDate
{
	
}

//- (NSDate *)thisDayFromDate:(NSDate *)date;		// start of day
- (void)test_thisDayFromDate
{
	
}

//- (NSDate *)previousDayFromDate:(NSDate *)date;
- (void)test_previousDayFromDate
{
	
}

//- (NSDate *)nextDayFromDate:(NSDate *)date;
- (void)test_nextDayFromDate
{
	
}

//- (NSDate *)weekLaterThanDate:(NSDate *)date;
- (void)test_weekLaterThanDate
{
	
}

//- (NSDate *)weekEarlierThanDate:(NSDate *)date;
- (void)test_weekEarlierThanDate
{
	
}

//- (NSDate *)thisWeekFromDate:(NSDate *)date;		// start of week
- (void)test_thisWeekFromDate
{
	
}

//- (NSDate *)previousWeekFromDate:(NSDate *)date;
- (void)test_previousWeekFromDate
{
	
}

//- (NSDate *)nextWeekFromDate:(NSDate *)date;
- (void)test_nextWeekFromDate
{
	
}

//- (NSDate *)startOfDayFromDate:(NSDate *)date;
- (void)test_startOfDayFromDate
{
	
}

//- (NSDate *)endOfDayFromDate:(NSDate *)date;
- (void)test_endOfDayFromDate
{
}

//- (NSDate *)yesterday;		// 00:00:00 yesterday
- (void)test_yesterday
{
	
}

//- (BOOL)dateIsYesterday:(NSDate *)date;
- (void)test_dateIsYesterday
{
	
}

//- (NSDate *)today;			// 00:00:00 today
- (void)test_today
{
	
}

//- (BOOL)dateIsBeforeToday:(NSDate *)date;
- (void)test_dateIsBeforeToday
{
	
}

//- (BOOL)dateIsToday:(NSDate *)date;
- (void)test_dateIsToday
{
	
}

//- (BOOL)dateIsAfterToday:(NSDate *)date;
- (void)test_dateIsAfterToday
{
	
}

//- (NSDate *)tomorrow;		// 00:00:00 tomorrow
- (void)test_tomorrow
{
	
}

//- (BOOL)dateIsTomorrow:(NSDate *)date;
- (void)test_dateIsTomorrow
{
	
}

//- (BOOL)date:(NSDate *)date isSameDayAsDate:(NSDate *)other;
- (void)test_dateIsSameDayAsDate
{
	
}

//- (BOOL)date:(NSDate *)date isBeforeDay:(NSDate *)other;
- (void)test_dateIsBeforeDay
{
	
}

//- (BOOL)date:(NSDate *)date isAfterDay:(NSDate *)other;
- (void)test_dateIisAfterDay
{
	
}

#if 0
- (void)testDateDaysFromToday
{
	NSDate *today = [NSDate today];
	NSDate *tomorrow = [NSDate tomorrow];
	NSDate *yesterday = [NSDate yesterday];
	
	STAssertTrue([[NSDate dateDaysFromToday:1] isSameDayAsDate:tomorrow], @"");
	STAssertTrue([[NSDate dateDaysFromToday:-1] isSameDayAsDate:yesterday], @"");
	STAssertTrue([[NSDate dateDaysFromToday:0] isSameDayAsDate:today], @"");
}

- (void)testHourLater
{
	NSDate *date = [NSDate date];
	NSDate *date2 = [date hourLater];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:date toDate:date2 options:0];
	STAssertTrue(components.hour==1, @"Not one hour later");
}

- (void)testHourEarlier
{
	NSDate *date = [NSDate date];
	NSDate *date2 = [date hourEarlier];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:date toDate:date2 options:0];
	STAssertTrue(components.hour==-1, @"Not one hour earlier");
}

- (void)testDayLater
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dayLater];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:now toDate:date2 options:0];
	STAssertTrue(components.day==1, @"Not one day later");
	
}

- (void)testDayEarlier
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dayEarlier];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:now toDate:date2 options:0];
	STAssertTrue(components.day==-1, @"Not one day earler! %d",components.day);
}

- (void)testWeekLater
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now weekLater];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:now toDate:date2 options:0];
	STAssertTrue(components.week==1, @"Not one week later! %d",components.week);
}

- (void)testWeekEarlier
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now weekEarlier];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:now toDate:date2 options:0];
	STAssertTrue(components.week==-1, @"Not one week earlier! %d",components.week);
}

// yesterday
- (void)testYesterday
{
	NSDate *date1 = [[[NSDate date] dayEarlier] startOfDay];
	NSDate *date2 = [NSDate yesterday];
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:date1 toDate:date2 options:0];
	STAssertTrue(components.day == 0, @"Dates don't match! %d",components.day);
}

- (void)testIsYesterday
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [[NSDate today] dayEarlier];
	NSDate *date3 = [NSDate tomorrow];
	NSDate *date4 = [NSDate yesterday];
	
	STAssertFalse([now isYesterday], @"%@",now);
	STAssertTrue([date2 isYesterday], @"%@",date2);
	STAssertFalse([date3 isYesterday], @"%@",date3);
	STAssertTrue([date4 isYesterday], @"%@",date4);
}

// today
- (void)testToday
{
	NSDate *now = [NSDate date];
	NSDate *today = [NSDate today];
	NSDate *tomorrow = [NSDate tomorrow];
	NSDate *yesterday = [NSDate yesterday];
	
	STAssertTrue([now isSameDayAsDate:today],@"%@",now);
	STAssertFalse([tomorrow isSameDayAsDate:today], @"%@",today);
	STAssertFalse([yesterday isSameDayAsDate:today], @"%@",today);
}

- (void)testIsBeforeToday
{
	NSDate *today = [NSDate today];
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dayEarlier];
	NSDate *date3 = [NSDate tomorrow];
	NSDate *date4 = [NSDate yesterday];
	
	STAssertFalse([now isBeforeToday], @"%@ (%@)",now,today);
	STAssertTrue([date2 isBeforeToday], @"%@ (%@)",date2,today);
	STAssertFalse([date3 isBeforeToday], @"%@ (%@)",date3,today);
	STAssertTrue([date4 isBeforeToday], @"%@ (%@)",date4,today);
}

- (void)testIsToday
{
	NSDate *today = [NSDate today];
	NSDate *now = [NSDate date];
	NSDate *date2 = [NSDate today];
	NSDate *date3 = [NSDate tomorrow];
	NSDate *date4 = [NSDate yesterday];
	
	STAssertTrue([now isToday], @"%@ (%@)",now,today);
	STAssertTrue([date2 isToday], @"%@ (%@)",date2,today);
	STAssertFalse([date3 isToday], @"%@ (%@)",date3,today);
	STAssertFalse([date4 isToday], @"%@ (%@)",date4,today);
}

- (void)testIsAfterToday
{
	NSDate *today = [NSDate today];
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dayLater];
	NSDate *date3 = [NSDate tomorrow];
	NSDate *date4 = [NSDate yesterday];
	
	STAssertFalse([now isAfterToday], @"%@ (%@)",now,today);
	STAssertTrue([date2 isAfterToday], @"%@ (%@)",date2,today);
	STAssertTrue([date3 isAfterToday], @"%@ (%@)",date3,today);
	STAssertFalse([date4 isAfterToday], @"%@ (%@)",date4,today);
}

// tomorrow
- (void)testTomorrow
{
	NSDate *now = [NSDate date];
	NSDate *today = [NSDate today];
	NSDate *tomorrow = [NSDate tomorrow];
	NSDate *yesterday = [NSDate yesterday];
	
	STAssertTrue([tomorrow isSameDayAsDate:[today nextDay]],@"%@",[today nextDay]);
	STAssertFalse([tomorrow isSameDayAsDate:now], @"%@ (%@)",now,tomorrow);
	STAssertFalse([tomorrow isSameDayAsDate:today], @"%@",today);
	STAssertFalse([tomorrow isSameDayAsDate:yesterday], @"%@",yesterday);
}

- (void)testIsTomorrow
{
	NSDate *today = [NSDate today];
	NSDate *now = [NSDate date];
	NSDate *date2 = [[NSDate today] dayLater];
	NSDate *date3 = [NSDate tomorrow];
	NSDate *date4 = [NSDate yesterday];
	
	STAssertFalse([today isTomorrow], @"%@",today);
	STAssertTrue([today isSameDayAsDate:now], @"%@ (%@)",now,today);
	STAssertTrue([date2 isSameDayAsDate:date3], @"%@ %@",date2,date3);
//	STAssertTrue([now isTomorrow], @"%@ (%@)",now,today);
//	STAssertFalse([now isTomorrow], @"%@ (%@)",now,today);
	STAssertTrue([date2 isTomorrow], @"%@ (%@)",date2,today);
	STAssertTrue([date3 isTomorrow], @"%@ (%@)",date3,today);
	STAssertFalse([date4 isTomorrow], @"%@ (%@)",date4,today);
}

- (void)testIsSameDayAsDate
{
	NSDate *now = [NSDate date];
	NSDate *today = [NSDate today];
	NSDate *tomorrow = [NSDate tomorrow];
	NSDate *yesterday = [NSDate yesterday];
	
	STAssertTrue([now isSameDayAsDate:today], @"");
	STAssertFalse([today isSameDayAsDate:tomorrow], @"");
	STAssertFalse([today isSameDayAsDate:yesterday], @"");
	STAssertFalse([yesterday isSameDayAsDate:tomorrow], @"");
	STAssertTrue([[today nextDay] isSameDayAsDate:tomorrow], @"");
	STAssertTrue([[today previousDay] isSameDayAsDate:yesterday], @"");
}

- (void)testIsBeforeDate
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dateByAddingTimeInterval:-10.0];
	STAssertTrue([date2 isBeforeDate:now], @"%@ should be before %@",date2,now);
}

- (void)testIsAfterDate
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dateByAddingTimeInterval:10.0];
	STAssertTrue([date2 isAfterDate:now], @"%@ should be after %@",date2,now);
}

- (void)testIsBeforeNow
{
	NSDate *date = [[NSDate date] dateByAddingTimeInterval:-10.0];	// 10 seconds behind
	STAssertTrue([date isBeforeNow], @"%@ shoud be before now",date);
}

- (void)testIsAfterNow
{
	NSDate *date = [[NSDate date] dateByAddingTimeInterval:10.0];	// 10 seconds ahead
	STAssertTrue([date isAfterNow], @"%@ should be after now",date);
	
}
	
#endif
@end
