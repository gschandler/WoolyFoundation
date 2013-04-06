//
//  NSCalendar+WoolyFoundation.h
//  WoolyFoundation
//
//  Created by Scott Chandler on 4/16/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (WoolyFoundation)
- (NSDate *)dateByReplacingComponents:(NSDateComponents *)comps forCalendarUnits:(NSCalendarUnit)units toDate:(NSDate *)date;
@end

@interface NSDateComponents (WoolyFoundation)
- (void)setValue:(NSInteger)value forCalendarUnit:(NSCalendarUnit)unit;
@end