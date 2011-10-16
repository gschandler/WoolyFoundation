//
//  NSBundle+Extensions.h
//  Gigbook
//
//  Created by Scott Chandler on 1/3/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSBundle(WoolyBeast)
- (NSString *)shortVersionString;
- (NSString *)bundleVersionString;
- (NSString *)getInfoString;
@end
