//
//  NSArray+Extensions.h
//  WoolyFoundation
//
//  Created by Scott Chandler on 4/26/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray(WoolyBeast)
- (id)firstObject;
@end

@interface NSMutableArray(WoolyBeast)
- (void)insertObject:(id)object afterObject:(id)other;
- (void)insertObject:(id)object beforeObject:(id)other;

// Assumes an existing sorted list, will add new item on O(nlogn) time
- (void)addObject:(id)object sortedUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context;
- (void)addObject:(id)object sortedUsingSelector:(SEL)selector;
- (void)addObject:(id)object sortedUsingDescriptors:(NSArray *)descriptors;

- (void)removeFirstObject;
@end