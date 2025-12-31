//
//  NSArray+WoolyFoundation.h
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

#import <Foundation/Foundation.h>


@interface NSArray (WoolyFoundation)
@property (nonatomic, readonly) BOOL hasObjects;

// convenient way to get next/previous object. Very inefficient, do not use to iterate an array.
- (id)nextObjectAfter:(id)object;
- (id)previousObjectBefore:(id)object;

@property (nonatomic, copy, readonly) NSArray *reversedArray;

- (BOOL)validIndex:(NSInteger)index;

- (BOOL)wb_intersectsArray:(NSArray *)other;

#if NS_BLOCKS_AVAILABLE
- (NSArray *)wb_filter:(BOOL (^)(id))block;
- (NSArray *)wb_map:(id (^)(id))block;
- (NSArray *)wb_compactMap:(id (^)(id))block;
- (id)wb_reduce:(id)initialValue apply:(id (^)(id, id))block;
#endif
@end

@interface NSMutableArray (WoolyFoundation)

// quick add methods
- (void)prependObject:(id)object;
- (void)appendObject:(id)object;

// if 'other' object is not in array, object is not inserted into the list
- (void)insertObject:(id)object afterObject:(id)other;
- (void)insertObject:(id)object beforeObject:(id)other;

// Assumes an existing sorted list, will add new item on O(nlogn) time
- (void)addObject:(id)object sortedUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context;
- (void)addObject:(id)object sortedUsingSelector:(SEL)selector;
- (void)addObject:(id)object sortedUsingDescriptors:(NSArray *)descriptors;

// companion to 'removeLastObject'
- (void)removeFirstObject;

- (void)reverse;


@end
