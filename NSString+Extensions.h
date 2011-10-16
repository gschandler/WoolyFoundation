//
//  NSString+Extensions.h
//  Gigbook
//
//  Created by Scott Chandler on 5/3/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString(WoolyBeast)

- (unichar)firstCharacter;
- (NSString *)substringWithFirstCharacter;
- (NSComparisonResult)localizedCaseInsensitiveNumericCompare:(NSString *)other;
@end
