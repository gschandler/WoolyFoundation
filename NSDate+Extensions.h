//
//  NSDate+Extensions.h
//  WBUtilities
//
//  Created by Scott Chandler on 1/12/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (WoolyBeast)

+ (NSDate *)dateDaysFromToday:(NSInteger)days;

- (NSDate *)hourLater;
- (NSDate *)hourEarlier;
- (NSDate *)dayLater;
- (NSDate *)dayEarlier;
- (NSDate *)weekLater;
- (NSDate *)weekEarlier;

- (NSDate *)beginningOfDay;

// yesterday
+ (NSDate *)yesterday;		// midnight yesterday
- (BOOL)isYesterday;

// today
+ (NSDate *)today;			// midnight today
- (BOOL)isBeforeToday;
- (BOOL)isToday;
- (BOOL)isAfterToday;

// tomorrow
+ (NSDate *)tomorrow;		// midnight tomorrow
- (BOOL)isTomorrow;

- (BOOL)isSameDayAsDate:(NSDate *)date;

- (BOOL)isBeforeDate:(NSDate *)date;
- (BOOL)isAfterDate:(NSDate *)date;

- (BOOL)isBeforeNow;
- (BOOL)isAfterNow;

@end
