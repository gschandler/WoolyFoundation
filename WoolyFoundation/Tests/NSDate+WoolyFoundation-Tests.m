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
#import "NSDate+WoolyFoundation.h"

@interface NSDate_WoolyFoundation_Tests : XCTestCase
{
}
@end


@implementation NSDate_WoolyFoundation_Tests

- (void)setUp
{
	
}

- (void)tearDown
{
	
}

- (void)testIsBeforeDate
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dateByAddingTimeInterval:-10.0];
	XCTAssertTrue([date2 isBeforeDate:now], @"%@ should be before %@",date2,now);
}

- (void)testIsAfterDate
{
	NSDate *now = [NSDate date];
	NSDate *date2 = [now dateByAddingTimeInterval:10.0];
	XCTAssertTrue([date2 isAfterDate:now], @"%@ should be after %@",date2,now);
}

- (void)testIsBeforeNow
{
	NSDate *date = [[NSDate date] dateByAddingTimeInterval:-10.0];	// 10 seconds behind
	XCTAssertTrue([date isBeforeNow], @"%@ shoud be before now",date);
}

- (void)testIsAfterNow
{
	NSDate *date = [[NSDate date] dateByAddingTimeInterval:10.0];	// 10 seconds ahead
	XCTAssertTrue([date isAfterNow], @"%@ should be after now",date);
	
}
	

@end
