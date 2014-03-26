//
//  NSDictionary+WoolyFoundation.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 2/24/14.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSDictionary+WoolyFoundation.h"

@interface NSDictionary_WoolyFoundation_Tests : SenTestCase

@end

@implementation NSDictionary_WoolyFoundation_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testContainsKey
{
	NSDictionary *test = @{ @"First" : @"Item 1", @"Second " : @"Item 2"};
	STAssertTrue([test containsKey:@"First"], @"");
	STAssertFalse([test containsKey:@"Third"], @"");
}

- (void)testRemoveObject
{
	NSMutableDictionary *test = [NSMutableDictionary dictionary];
	[test setObject:@"Value" forKey:@"First"];
	[test setObject:@"Value" forKey:@"Second"];
	[test setObject:@"Other Value" forKey:@"Third"];
	
	STAssertTrue([test containsKey:@"First"], @"");
	STAssertTrue([[test objectForKey:@"First"] isEqualToString:@"Value"], @"");
	STAssertTrue([test containsKey:@"Second"], @"");
	STAssertTrue([[test objectForKey:@"Second"] isEqualToString:@"Value"], @"");
	STAssertTrue([test containsKey:@"Third"], @"");
	STAssertTrue([[test objectForKey:@"Third"] isEqualToString:@"Other Value"], @"");
	
	STAssertTrue([[test allValues] count] == 3, @"");
	STAssertTrue([[test allKeys] count] == 3, @"");
	
	[test removeObject:@"Value"];
	STAssertFalse([test containsKey:@"First"], @"");
	STAssertFalse([test containsKey:@"Second"], @"");
	STAssertTrue([test containsKey:@"Third"], @"");
	
}

@end
