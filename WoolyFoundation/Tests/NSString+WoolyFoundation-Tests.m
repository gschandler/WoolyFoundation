//
//  NSString+WoolyFoundation-Tests.m
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
#import "NSString+WoolyFoundation.h"

@interface NSString_WoolyFoundation_Tests : XCTestCase {
	
}
@end


@implementation NSString_WoolyFoundation_Tests

- (void)testFirstCharacter
{
	NSString *test = @"This is a test string";
	unichar correctValue = 'T';
	unichar value = test.firstCharacter;
	XCTAssertTrue(value == correctValue,@"firstCharacter failed: Got %C, Wanted %C",value,correctValue);

}

- (void)testSubstringWithFirstCharacter
{
	NSString *test = @"This is a test string";
	NSString *correctResult = @"T";
	NSString *result = test.substringWithFirstCharacter;
	XCTAssertTrue( [result isEqualToString:correctResult], @"substringWithFirstCharacter failed: Got \"%@\", Wanted \"%@\"",result,correctResult);
}

- (void)testLocalizedCaseInsensitiveNumericCompare
{
	NSString *test1 = @"1234";
	NSString *test2 = @"Abcd";
	NSString *test3 = @"abcd";
	NSString *test4 = @"åbcd";
	
//	NSOrderedAscending = -1, NSOrderedSame, NSOrderedDescending
	XCTAssertTrue([test1 localizedCaseInsensitiveCompare:test2] == NSOrderedAscending,@"");
	XCTAssertTrue([test2 localizedCaseInsensitiveCompare:test3] == NSOrderedSame,@"");
	XCTAssertTrue([test3 localizedCaseInsensitiveCompare:test4] == NSOrderedAscending,@"");
	
}

@end
