//
//  NSString+WoolyFoundation.m
//  Gigbook
//
//  Created by Scott Chandler on 5/3/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
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
