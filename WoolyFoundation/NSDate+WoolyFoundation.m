//
//  NSDate+WoolyFoundation.m
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

#import "NSDate+WoolyFoundation.h"
#import "WoolyMemory.h"



@implementation NSDate (WoolyFoundation)

- (BOOL)isBeforeDate:(NSDate *)date
{
	NSDate *result = [date earlierDate:self];
	return result != date;
}

- (BOOL)isAfterDate:(NSDate *)date
{
	NSDate *result = [date laterDate:self];
	return result != date;
}

- (BOOL)isBeforeNow
{
	return [self isBeforeDate:[NSDate date]];
}

- (BOOL)isAfterNow
{
	return [self isAfterDate:[NSDate date]];
}

- (BOOL)isFuture
{
	return [self isAfterNow];
}

- (BOOL)isPast
{
	return [self isBeforeNow];
}

- (NSDate *)integralDate
{
	NSTimeInterval seconds = [self timeIntervalSinceReferenceDate];
	NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:trunc(seconds)];
	return date;
}

@end
