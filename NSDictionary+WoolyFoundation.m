//
//  NSDictionary+WoolyBeast.m
//  WoolyFoundation
//
//  Created by Scott Chandler on 8/9/12.
//
//

#import "NSDictionary+WoolyFoundation.h"

@implementation NSDictionary (WoolyFoundation)

@end


@implementation NSMutableDictionary (WoolyFoundation)

- (void)removeObject:(id)object
{
	NSParameterAssert(object);
	
	if ( object ) {
		NSArray *keys = [self allKeysForObject:object];
		[self removeObjectsForKeys:keys];
	}
}

@end