//
//  NSArray+WoolyFoundation-Tests.m
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

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+WoolyFoundation.h"

@interface NSArray_WoolyFoundation_Tests : SenTestCase
{
}
@end

@implementation NSArray_WoolyFoundation_Tests

- (void)testFirstObject
{
	NSArray *items = @[@"First",@"Second",@"Third"];
	
	STAssertTrue([[items firstObject] isEqual:[items objectAtIndex:0]],@"firstObject failed");
}

- (void)testIsEmpty
{
	NSArray *items = @[];
	STAssertTrue([items isEmpty], @"");
}

- (void)testReversedArray
{
	NSArray *items = @[@"one",@"two",@"three"];
	NSArray *reversedItems = [items reversedArray];
	for ( int i=0,ri=items.count-1; i<items.count;++i,--ri) {
		STAssertTrue([[items objectAtIndex:i] isEqual:[reversedItems objectAtIndex:ri]], @"");
	}
}

- (void)testPrependObject
{
	NSMutableArray *items = [NSMutableArray arrayWithArray: @[@"one"]];
	NSString * const kValue = @"zero";
	[items prependObject:kValue];
	STAssertTrue([[items firstObject] isEqualToString:kValue], @"");
}

- (void)testAppendObject
{
	NSMutableArray *items = [NSMutableArray arrayWithArray: @[@"one"]];
	NSString * const kValue = @"zero";
	[items appendObject:kValue];
	STAssertTrue([[items lastObject] isEqualToString:kValue], @"");
}

- (void)testReverse
{
	NSArray *items = @[@"one",@"two",@"three"];
	NSMutableArray *reversedItems = [NSMutableArray arrayWithArray:items];
	[reversedItems reverse];
	
	for ( int i=0,ri=items.count-1; i<items.count;++i,--ri) {
		STAssertTrue([[items objectAtIndex:i] isEqual:[reversedItems objectAtIndex:ri]], @"");
	}
}

- (void)testRemoveFirstObject
{
	NSMutableArray *items = [NSMutableArray arrayWithArray:@[@"one",@"two"]];
	[items removeFirstObject];
	STAssertTrue([[items firstObject] isEqualToString:@"two"], @"");
}
@end
