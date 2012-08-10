//
//  NSNumber+Extensions.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 11/3/11.
//  Copyright (c) 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSValue+Extensions.h"

@implementation NSNumber (WoolyFoundation)
+ (NSNumber *)numberWithBoolYES
{
	return [NSNumber numberWithBool:YES];
}

+ (NSNumber *)numberWithBoolNO
{
	return [NSNumber numberWithBool:NO];
}

@end
