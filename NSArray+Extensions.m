//
//  NSArray+Extensions.m
//  Gigbook
//
//  Created by Scott Chandler on 4/26/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSArray+Extensions.h"
#import <objc/message.h>

@implementation NSArray(WoolyBeast)

- (id)firstObject
{
	if ( self.count > 0 ) 
		return [self objectAtIndex:0];
	else
		return nil;
}
@end



@implementation NSMutableArray(WoolyBeast)
- (void)insertObject:(id)object afterObject:(id)other
{
	NSAssert(object,@"Invalid nil parameter 1");
	NSAssert(other,@"Invalid nil parameter 2");
	NSInteger index = [self indexOfObject:other];
	if ( index != NSNotFound ) {
		[self insertObject:object atIndex:index+1];
	}
}

- (void)insertObject:(id)object beforeObject:(id)other
{
	NSAssert(object,@"Invalid nil parameter 1");
	NSAssert(other,@"Invalid nil parameter 2");
	NSInteger index = [self indexOfObject:other];
	if ( index != NSNotFound ) {
		[self insertObject:object atIndex:index];
	}
}

- (void)addObject:(id)object sortedUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context
{
	if ( comparator ) {
		NSInteger left = 0, right = [self count]-1, index = (right-left)/2;
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
	if ( selector ) {
		[self addObject:object sortedUsingFunction:&SelectorComparator context:selector];
	}
}

- (void)addObject:(id)object sortedUsingDescriptors:(NSArray *)descriptors;
{
	if ( descriptors != nil && descriptors.count > 0 ) {
		NSEnumerator *cursor = [descriptors objectEnumerator];
		NSSortDescriptor *descriptor = [cursor nextObject];
		NSInteger left = 0, right = [self count]-1, index = (right-left)/2;
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

@end