//
//  NSBundle+Extensions.m
//  Gigbook
//
//  Created by Scott Chandler on 1/3/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSBundle+Extensions.h"

static NSString *	kCFBundleShortVersionString = @"CFBundleShortVersionString";
static NSString *	kCFBundleGetInfoString = @"CFBundleGetInfoString";

@implementation NSBundle(WoolyBeast)
- (NSString *)shortVersionString
{
	return [self objectForInfoDictionaryKey:kCFBundleShortVersionString];
}

- (NSString *)bundleVersionString
{
	return [self objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

- (NSString *)getInfoString
{
	return [self objectForInfoDictionaryKey:kCFBundleGetInfoString];
}
@end
