//
//  NSDictionary+WoolyFoundation.m
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

#import "NSDictionary+WoolyFoundation.h"

@implementation NSDictionary (WoolyFoundation)

- (NSDictionary *)wbs_filter:(BOOL (^)(id key, id obj))predicate
{
    NSParameterAssert(predicate);
    if (!predicate) { return self; }

    NSMutableDictionary *filtered = [[NSMutableDictionary alloc] initWithDictionary:self];
    [filtered wbs_filter:predicate];
    return [filtered copy];
}

- (BOOL)containsKey:(id)key
{
	return [self objectForKey:key] != nil;
}

- (BOOL)hasObjects
{
    return self.count > 0;
}

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

- (void)wbs_filter:(BOOL (^)(id key, id obj))predicate
{
    NSParameterAssert(predicate);
    if (!predicate) { return; }
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!predicate(key, obj)) {
            [self removeObjectForKey:key];
        }
    }];
}
@end


