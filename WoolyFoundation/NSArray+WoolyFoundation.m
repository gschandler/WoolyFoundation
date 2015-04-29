//
//  NSArray+WoolyFoundation.m
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

#import "NSArray+WoolyFoundation.h"
#import <objc/message.h>

@implementation NSArray(WoolyFoundation)
- (BOOL)isEmpty
{
	return self.count == 0;
}

- (id)nextObject:(id)object
{
	id newObject = nil;
	if ( object != nil ) {

		NSInteger index = [self indexOfObject:object];
		if ( index != NSNotFound && ++index < [self count] ) {
			newObject = [self objectAtIndex:index];
		}
	}
	return newObject;
}

- (id)previousObject:(id)object
{
	id newObject = nil;
	if ( object != nil ) {
		
		NSInteger index = [self indexOfObject:object];
		if ( index != NSNotFound && index-- > 0 ) {
			newObject = [self objectAtIndex:index];
		}
	}
	return newObject;
}

- (NSArray *)reversedArray
{
	NSMutableArray *work = [NSMutableArray arrayWithArray:self];
	[work reverse];
	return [NSArray arrayWithArray:work];
}

- (BOOL)validIndex:(NSInteger)index
{
	return self.count > index && index >= 0;
}

- (BOOL)wb_intersectsArray:(NSArray *)other
{
	return (other && other.count) ? [self firstObjectCommonWithArray:other] != nil : NO;
}

#if NS_BLOCKS_AVAILABLE
- (NSArray *)wb_filter:(BOOL (^)(id))block
{
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
	if ( block ) {
		for ( id obj in self ) {
			BOOL keep = block(obj);
			if ( keep ) {
				[result addObject:obj];
			}
		}
	}
	return result;
}

- (NSArray *)wb_map:(id (^)(id))block
{
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
	if ( block ) {
		for ( id obj in self ) {
			id value = block(obj);
			if ( !value ) {
				[NSException raise:NSInternalInconsistencyException format:@"Invalid return value from the block (nil)"];
			}
			else {
				[result addObject:value];
			}
		}
	}
	return result;
}

- (id)wb_reduce:(id)initialValue apply:(id (^)(id, id))block
{
	id result = initialValue;
	if ( block ) {
		for ( id obj in self ) {
			result = block(result,obj);
		}
	}
	return result;
}


#endif

@end



@implementation NSMutableArray(WoolyFoundation)
- (void)prependObject:(id)object
{
	NSParameterAssert(object);
	[self insertObject:object atIndex:0];
}

- (void)appendObject:(id)object
{
	NSParameterAssert(object);
	[self addObject:object];
}

- (void)insertObject:(id)object afterObject:(id)other
{
	NSParameterAssert(object);
	NSParameterAssert(other);
	NSParameterAssert([self containsObject:other]);

	if ( other && object ) {
		NSInteger index = [self indexOfObject:other];
		if ( index != NSNotFound ) {
			[self insertObject:object atIndex:index+1];
		}
	}
}

- (void)insertObject:(id)object beforeObject:(id)other
{
	NSParameterAssert(object);
	NSParameterAssert(other);
	NSParameterAssert([self containsObject:other]);
	
	if ( object && other ) {
		NSInteger index = [self indexOfObject:other];
		if ( index != NSNotFound ) {
			[self insertObject:object atIndex:index];
		}
	}
}

- (void)addObject:(id)object sortedUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context
{
	NSParameterAssert(object);
	NSParameterAssert(comparator);
	
	if ( object && comparator ) {
		NSInteger left = 0, right = [self count]-1, index = right/2;
		IMP objectAtIndexImp = [self methodForSelector:@selector(objectAtIndex:)];
		while ( left <= right ) {
			id other = objectAtIndexImp(self,@selector(objectAtIndex:),index);
			
			NSComparisonResult result = (NSComparisonResult)comparator(object,other,context);
			//			NSComparisonResult result = (NSComparisonResult)[object performSelector:selector withObject:other];
			
			if ( result == NSOrderedAscending )	{		// left < right
				right = index - 1;
			}
			else if ( result == NSOrderedDescending ) {	// left > right
				left = index + 1;
			}
			else {
				left = right = index;
			}
			
			index = left + ((right - left)/2);
		}
		[self insertObject:object atIndex:index];
	}
}

static NSInteger SelectorComparator( id obj1, id obj2, void *context )
{
	return (NSInteger)objc_msgSend( obj1, (SEL)context, obj2 );
}

-(void)addObject:(id)object sortedUsingSelector:(SEL)selector
{
	NSParameterAssert(object);
	NSParameterAssert(selector);
	
	if ( object && selector ) {
		[self addObject:object sortedUsingFunction:&SelectorComparator context:selector];
	}
}

- (void)addObject:(id)object sortedUsingDescriptors:(NSArray *)descriptors;
{
	NSParameterAssert(object);
	NSParameterAssert(descriptors);
	
	if ( object && descriptors && descriptors.count > 0 ) {
		NSEnumerator *cursor = [descriptors objectEnumerator];
		NSSortDescriptor *descriptor = [cursor nextObject];
		NSInteger left = 0, right = [self count]-1, index = right/2;
		
		IMP objectAtIndexImp = [self methodForSelector:@selector(objectAtIndex:)];
		IMP	compareObjectToObjectImp = [descriptor methodForSelector:@selector(compareObject:toObject:)];

		while (descriptor && left <= right ) {
			id other = objectAtIndexImp(self,@selector(objectAtIndex:),index);
			NSComparisonResult result = (NSComparisonResult)compareObjectToObjectImp(descriptor,@selector(compareObject:toObject:),object,other);//  [descriptor compareObject:object toObject:other];
			
			if ( result == NSOrderedAscending )	{		// left < right
				right = index - 1;
			}
			else if ( result == NSOrderedDescending ) {	// left > right
				left = index + 1;
			}
			else {
				descriptor = [cursor nextObject];
				if ( descriptor == nil ) {
					left = right = index;
				}
			}
			
			index = left + ((right - left)/2);
		}
		[self insertObject:object atIndex:index];
	}
}

- (void)removeFirstObject
{
    if ( self.count > 0 ) {
        [self removeObjectAtIndex:0];
    }
}

- (void)reverse
{
	NSInteger left = 0, right = self.count - 1;
	while ( left < right ) {
		[self exchangeObjectAtIndex:left++ withObjectAtIndex:right--];
	}
}

@end