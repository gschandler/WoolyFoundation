//
//  NSBundle+WoolyFoundation.m
//  Gigbook
//
//  Created by Scott Chandler on 1/3/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSBundle+WoolyFoundation.h"

static NSString * const	kCFBundleShortVersionString = @"CFBundleShortVersionString";
static NSString * const	kCFBundleGetInfoString = @"CFBundleGetInfoString";

@implementation NSBundle(WoolyFoundation)
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
