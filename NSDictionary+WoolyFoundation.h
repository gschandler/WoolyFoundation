//
//  NSDictionary+WoolyBeast.h
//  WoolyFoundation
//
//  Created by Scott Chandler on 8/9/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WoolyFoundation)

@end


@interface NSMutableDictionary (WoolyFoundation)
// removes object and all associated keys
- (void)removeObject:(id)object;
@end