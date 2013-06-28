//
//  NSString+WoolyFoundation.m
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

#import "NSString+WoolyFoundation.h"


@implementation NSString(WoolyFoundation)

- (unichar)firstCharacter
{
	unichar c = 0;
	if ( self.length > 0 )
		c = [self characterAtIndex:0];
	return c;
}

- (NSString *)substringWithFirstCharacter
{
	NSString * s = nil;
	unichar c = [self firstCharacter];
	if ( c != 0 ) {
		s = [NSString stringWithCharacters:&c length:1];
	}
	return s;
}

- (NSComparisonResult)localizedCaseInsensitiveNumericCompare:(NSString *)other
{
	return [self compare:other
				 options:NSCaseInsensitiveSearch+NSNumericSearch+NSWidthInsensitiveSearch+NSForcedOrderingSearch
				   range:NSMakeRange(0, self.length)
				  locale:[NSLocale currentLocale]];
}
@end
