//
//  NSArray+Extensions-Tests.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 11/24/11.
//  Copyright (c) 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSArray+Extensions.h"

@interface NSArray_Extensions_Tests : SenTestCase
{
}
@end

@implementation NSArray_Extensions_Tests

- (void)testFirstObject
{
	NSArray *items = [NSArray arrayWithObjects:@"First",@"Second",@"Third", nil];
	
	STAsserTrue([[items firstObject] isEqual:[items objectAtIndex:0]],@"firstObject failed");
}

@end
