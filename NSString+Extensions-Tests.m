//
//  NSString+Extensions-Tests.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 4/6/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "NSString+Extensions.h"

@interface NSString_Extensions_Tests : SenTestCase {
	
}
@end


@implementation NSString_Extensions_Tests

- (void)testFirstCharacter
{
	NSString *test = @"This is a test string";
	unichar correctValue = 'T';
	unichar value = test.firstCharacter;
	STAssertTrue(value == correctValue,@"firstCharacter failed: Got %C, Wanted %C",value,correctValue);

}

- (void)testSubstringWithFirstCharacter
{
	NSString *test = @"This is a test string";
	NSString *correctResult = @"T";
	NSString *result = test.substringWithFirstCharacter;
	STAssertTrue( [result isEqualToString:correctResult], @"substringWithFirstCharacter failed: Got \"%@\", Wanted \"%@\"",result,correctResult);
}

- (void)testLocalizedCaseInsensitiveNumericCompare
{
	NSString *test1 = @"1234";
	NSString *test2 = @"Abcd";
	NSString *test3 = @"abcd";
	NSString *test4 = @"åbcd";
	
//	NSOrderedAscending = -1, NSOrderedSame, NSOrderedDescending
	STAssertTrue([test1 localizedCaseInsensitiveCompare:test2] == NSOrderedAscending,@"");
	STAssertTrue([test2 localizedCaseInsensitiveCompare:test3] == NSOrderedSame,@"");
	STAssertTrue([test3 localizedCaseInsensitiveCompare:test4] == NSOrderedAscending,@"");
	
}

@end
