//
//  NSDictionary+WoolyFoundation.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 2/24/14.
//
//

#import <XCTest/XCTest.h>
#import "NSDictionary+WoolyFoundation.h"

@interface NSDictionary_WoolyFoundation_Tests : XCTestCase

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
	XCTAssertTrue([test containsKey:@"First"], @"");
	XCTAssertFalse([test containsKey:@"Third"], @"");
}

- (void)testRemoveObject
{
	NSMutableDictionary *test = [NSMutableDictionary dictionary];
	[test setObject:@"Value" forKey:@"First"];
	[test setObject:@"Value" forKey:@"Second"];
	[test setObject:@"Other Value" forKey:@"Third"];
	
	XCTAssertTrue([test containsKey:@"First"], @"");
	XCTAssertTrue([[test objectForKey:@"First"] isEqualToString:@"Value"], @"");
	XCTAssertTrue([test containsKey:@"Second"], @"");
	XCTAssertTrue([[test objectForKey:@"Second"] isEqualToString:@"Value"], @"");
	XCTAssertTrue([test containsKey:@"Third"], @"");
	XCTAssertTrue([[test objectForKey:@"Third"] isEqualToString:@"Other Value"], @"");
	
	XCTAssertTrue([[test allValues] count] == 3, @"");
	XCTAssertTrue([[test allKeys] count] == 3, @"");
	
	[test removeObject:@"Value"];
	XCTAssertFalse([test containsKey:@"First"], @"");
	XCTAssertFalse([test containsKey:@"Second"], @"");
	XCTAssertTrue([test containsKey:@"Third"], @"");
	
}

@end
