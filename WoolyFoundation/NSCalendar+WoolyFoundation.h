//
//  NSCalendar+WoolyFoundation.h
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

#import <Foundation/Foundation.h>

@interface NSCalendar (WoolyFoundation)
- (NSDate *)dateByReplacingComponents:(NSDateComponents *)comps forCalendarUnits:(NSCalendarUnit)units toDate:(NSDate *)date;

// calculations
- (NSDate *)dateDaysFromToday:(NSInteger)days;

- (NSDate *)hourLaterThanDate:(NSDate *)date;
- (NSDate *)hourEarlierThanDate:(NSDate *)date;
- (NSDate *)thisHourFromDate:(NSDate *)date;		// start of hour
- (NSDate *)previousHourFromDate:(NSDate *)date;
- (NSDate *)nextHourFromDate:(NSDate *)date;

- (NSDate *)dayLaterThanDate:(NSDate *)date;
- (NSDate *)dayEarlierThanDate:(NSDate *)date;
- (NSDate *)thisDayFromDate:(NSDate *)date;		// start of day
- (NSDate *)previousDayFromDate:(NSDate *)date;
- (NSDate *)nextDayFromDate:(NSDate *)date;

- (NSDate *)weekLaterThanDate:(NSDate *)date;
- (NSDate *)weekEarlierThanDate:(NSDate *)date;
- (NSDate *)thisWeekFromDate:(NSDate *)date;		// start of week
- (NSDate *)previousWeekFromDate:(NSDate *)date;
- (NSDate *)nextWeekFromDate:(NSDate *)date;

- (NSDate *)startOfDayFromDate:(NSDate *)date;
- (NSDate *)endOfDayFromDate:(NSDate *)date;

// yesterday
- (NSDate *)yesterday;		// 00:00:00 yesterday
- (BOOL)dateIsYesterday:(NSDate *)date;

// today
- (NSDate *)today;			// 00:00:00 today
- (BOOL)dateIsBeforeToday:(NSDate *)date;
- (BOOL)dateIsToday:(NSDate *)date;
- (BOOL)dateIsAfterToday:(NSDate *)date;

// tomorrow
- (NSDate *)tomorrow;		// 00:00:00 tomorrow
- (BOOL)dateIsTomorrow:(NSDate *)date;

- (BOOL)date:(NSDate *)date isSameDayAsDate:(NSDate *)other;

// comparisons
- (BOOL)date:(NSDate *)date isBeforeDay:(NSDate *)other;
- (BOOL)date:(NSDate *)date isAfterDay:(NSDate *)other;
@end

@interface NSDateComponents (WoolyFoundation)
- (void)setValue:(NSInteger)value forCalendarUnit:(NSCalendarUnit)unit;
@end