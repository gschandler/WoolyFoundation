//
//  NSArray+WoolyFoundation.m
//  Gigbook
//
//  Created by Scott Chandler on 4/26/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSArray+WoolyFoundation.h"
#import <objc/message.h>

@implementation NSArray(WoolyFoundation)
- (id)firstObject
{
	id object = (self.count > 0) ? [self objectAtIndex:0] : nil;
	return object;
}

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